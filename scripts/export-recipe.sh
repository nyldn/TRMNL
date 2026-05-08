#!/usr/bin/env bash
set -euo pipefail

if [ "${1:-}" = "" ]; then
  echo "Usage: $0 <recipe-dir> [output-dir]" >&2
  exit 1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
recipe="$1"
output_dir="${2:-$repo_root/exports}"

if [[ "$recipe" != /* ]]; then
  recipe="$repo_root/$recipe"
fi

"$repo_root/scripts/validate-recipe.sh" "$recipe"

slug="$(basename "$recipe")"
mkdir -p "$output_dir"
tmp_dir="$(mktemp -d)"
cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

cp "$recipe/src/settings.yml" "$tmp_dir/settings.yml"
cp "$recipe/src/full.liquid" "$tmp_dir/full.liquid"
cp "$recipe/src/half_horizontal.liquid" "$tmp_dir/half_horizontal.liquid"
cp "$recipe/src/half_vertical.liquid" "$tmp_dir/half_vertical.liquid"
cp "$recipe/src/quadrant.liquid" "$tmp_dir/quadrant.liquid"

zip_path="$output_dir/$slug.zip"
rm -f "$zip_path"
(
  cd "$tmp_dir"
  zip -q -r "$zip_path" .
)

echo "Exported $zip_path"
