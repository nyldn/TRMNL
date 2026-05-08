---
name: trmnl-recipe-qa
description: Use when validating or reviewing a TRMNL Recipe/private plugin for structure, Liquid layout coverage, settings.yml correctness, privacy, export readiness, and publish risks.
---

# TRMNL Recipe QA

Use this skill before publishing, exporting, or claiming a recipe is ready.

## Checks

1. Run `./scripts/validate-recipe.sh <recipe-dir>` or the whole repo validation.
2. Inspect `src/settings.yml` for:
   - supported strategy
   - supported refresh interval
   - no hard-coded secrets
   - sensible custom fields
3. Inspect all four layout files:
   - `full`
   - `half_horizontal`
   - `half_vertical`
   - `quadrant`
4. Check sample data for privacy leaks.
5. Verify assumptions about rate limits, payload size, or publishing requirements against current TRMNL docs.
6. If release artifacts are needed, run `./scripts/export-recipe.sh <recipe-dir>` after validation.

## Output

Lead with findings ordered by severity. If no issues are found, say that clearly and list validation commands run plus any remaining manual preview risk.

