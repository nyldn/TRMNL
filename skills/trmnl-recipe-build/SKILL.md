---
name: trmnl-recipe-build
description: Use when creating or modifying TRMNL Recipe source files, including settings.yml, Liquid layout files, sample data, local preview configuration, and export-ready private plugin structure.
---

# TRMNL Recipe Build

Use this skill when implementing recipe source.

## Workflow

1. For new recipes, run `./scripts/new-recipe.sh <slug>`.
2. Edit only the recipe directory unless shared tooling is in scope.
3. Keep required files present:
   - `src/settings.yml`
   - `src/full.liquid`
   - `src/half_horizontal.liquid`
   - `src/half_vertical.liquid`
   - `src/quadrant.liquid`
4. Put anonymized examples in `data/sample.json`.
5. Use custom fields in `src/settings.yml` for user-provided secrets and configuration.
6. Design each layout for its own space. Do not simply dump the full layout into smaller views.
7. Run `./scripts/validate-recipe.sh <recipe-dir>`.
8. Preview with `./scripts/preview-recipe.sh <recipe-dir>` when visual behavior changed.

## Liquid Guidance

Use simple Liquid loops, conditionals, and filters. Prefer root-level sample data keys that are easy to read in templates. Keep long text clamped or summarized for half and quadrant layouts.

## Completion

Report changed files, validation commands, and any manual TRMNL import/preview step still needed.

