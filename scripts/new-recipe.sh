#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 <recipe-slug>" >&2
}

if [ "${1:-}" = "" ]; then
  usage
  exit 1
fi

slug="$1"
case "$slug" in
  *[!a-z0-9_-]*)
    echo "Recipe slug must use lowercase letters, numbers, underscores, or hyphens: $slug" >&2
    exit 1
    ;;
esac

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
template="$repo_root/recipes/_template"
target="$repo_root/recipes/$slug"

if [ -e "$target" ]; then
  echo "Recipe already exists: $target" >&2
  exit 1
fi

mkdir -p "$target"
cp -R "$template/." "$target/"

title="$(printf '%s' "$slug" | tr '_-' '  ' | awk '{for (i=1; i<=NF; i++) {$i=toupper(substr($i,1,1)) substr($i,2)}; print}')"

if command -v perl >/dev/null 2>&1; then
  perl -0pi -e "s/TRMNL Recipe Template/$title/g; s/trmnl-recipe-template/$slug/g" "$target/src/settings.yml" "$target/README.md" "$target/.trmnlp.yml"
fi

chmod +x "$target/bin/trmnlp"

echo "Created $target"
echo "Next: ./scripts/validate-recipe.sh recipes/$slug"

