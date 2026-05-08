#!/usr/bin/env bash
set -euo pipefail

if [ "${1:-}" = "" ]; then
  echo "Usage: $0 <recipe-dir> [trmnlp args...]" >&2
  exit 1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
recipe="$1"
shift || true

if [[ "$recipe" != /* ]]; then
  recipe="$repo_root/$recipe"
fi

if [ ! -d "$recipe" ]; then
  echo "Missing recipe directory: $recipe" >&2
  exit 1
fi

if [ ! -x "$recipe/bin/trmnlp" ]; then
  echo "Missing executable trmnlp wrapper: $recipe/bin/trmnlp" >&2
  exit 1
fi

cd "$recipe"
if [ "$#" -eq 0 ]; then
  set -- serve
fi

exec ./bin/trmnlp "$@"
