#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_files=(
  "src/settings.yml"
  "src/full.liquid"
  "src/half_horizontal.liquid"
  "src/half_vertical.liquid"
  "src/quadrant.liquid"
)

validate_one() {
  local recipe_dir="$1"
  local errors=0

  if [ ! -d "$recipe_dir" ]; then
    echo "Missing recipe directory: $recipe_dir" >&2
    return 1
  fi

  for rel in "${required_files[@]}"; do
    if [ ! -f "$recipe_dir/$rel" ]; then
      echo "Missing required file: $recipe_dir/$rel" >&2
      errors=$((errors + 1))
    fi
  done

  local settings="$recipe_dir/src/settings.yml"
  if [ -f "$settings" ]; then
    if ! grep -Eq '^name:[[:space:]]*.+' "$settings"; then
      echo "settings.yml missing name: $settings" >&2
      errors=$((errors + 1))
    fi
    if ! grep -Eq '^strategy:[[:space:]]*(static|polling|webhook|plugin_merge)[[:space:]]*$' "$settings"; then
      echo "settings.yml has unsupported or missing strategy: $settings" >&2
      errors=$((errors + 1))
    fi
    if ! grep -Eq '^refresh_interval:[[:space:]]*(15|60|360|720|1440)[[:space:]]*$' "$settings"; then
      echo "settings.yml has unsupported or missing refresh_interval: $settings" >&2
      errors=$((errors + 1))
    fi
    if command -v ruby >/dev/null 2>&1; then
      if ! ruby -e "require 'yaml'; YAML.load_file(ARGV.fetch(0))" "$settings" >/dev/null; then
        echo "settings.yml does not parse as YAML: $settings" >&2
        errors=$((errors + 1))
      fi
    fi
  fi

  local liquid
  while IFS= read -r liquid; do
    local bytes
    bytes="$(wc -c < "$liquid" | tr -d ' ')"
    if [ "$bytes" -gt 1048576 ]; then
      echo "Liquid template exceeds 1 MB: $liquid" >&2
      errors=$((errors + 1))
    fi
    if grep -Eiq '(api[_-]?key|access[_-]?token|secret|password|webhook_url|plugin_uuid)[[:space:]]*[:=][[:space:]]*["'\''][^"'\'']{8,}' "$liquid"; then
      echo "Possible committed secret in Liquid template: $liquid" >&2
      errors=$((errors + 1))
    fi
  done < <(find "$recipe_dir/src" -type f -name '*.liquid' | sort)

  if grep -RIEiq '(trmnl\.com/api/custom_plugins/[A-Za-z0-9_-]+|TRMNL_API_KEY=.+|TRMNL_WEBHOOK_URL=.+)' "$recipe_dir" 2>/dev/null; then
    echo "Possible TRMNL credential or webhook URL committed under: $recipe_dir" >&2
    errors=$((errors + 1))
  fi

  if [ "$errors" -gt 0 ]; then
    return 1
  fi

  echo "OK $recipe_dir"
}

if [ "$#" -gt 0 ]; then
  status=0
  for recipe in "$@"; do
    if [[ "$recipe" != /* ]]; then
      recipe="$repo_root/$recipe"
    fi
    validate_one "$recipe" || status=1
  done
  exit "$status"
fi

status=0
for recipe in "$repo_root"/recipes/* "$repo_root"/recipes/examples/*; do
  [ -d "$recipe" ] || continue
  case "$recipe" in
    */_template) ;;
    */examples) ;;
    *) validate_one "$recipe" || status=1 ;;
  esac
done

exit "$status"

