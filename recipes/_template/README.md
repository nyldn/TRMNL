# TRMNL Recipe Template

Use this directory as the starting point for a TRMNL private plugin or Recipe.

## Files

- `.trmnlp.yml`: local preview configuration
- `bin/trmnlp`: local preview wrapper
- `src/settings.yml`: TRMNL plugin settings
- `src/full.liquid`: full-screen layout
- `src/half_horizontal.liquid`: half-horizontal layout
- `src/half_vertical.liquid`: half-vertical layout
- `src/quadrant.liquid`: quadrant layout
- `src/shared.liquid`: optional local preview/shared-tab helper; the default export script keeps ZIPs to the five import-documented files
- `data/sample.json`: anonymized sample data

## Commands

```sh
../../scripts/validate-recipe.sh .
../../scripts/preview-recipe.sh .
../../scripts/export-recipe.sh .
```
