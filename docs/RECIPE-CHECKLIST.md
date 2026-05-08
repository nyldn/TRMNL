# Recipe Checklist

Use this before marking a TRMNL Recipe ready.

## Product Fit

- The screen answers one glanceable question.
- The refresh interval matches the data volatility.
- Private data is not exposed in previews, screenshots, or committed sample payloads.
- The recipe can run without a custom hosted backend unless a backend is clearly required.

## Source Files

- `src/settings.yml` exists and parses as YAML.
- `src/full.liquid` exists.
- `src/half_horizontal.liquid` exists.
- `src/half_vertical.liquid` exists.
- `src/quadrant.liquid` exists.
- No template exceeds 1 MB.
- Sample data lives under `data/` and is anonymized.

## settings.yml

- `name` is human-readable.
- `strategy` is one of `static`, `polling`, or `webhook` unless current docs support another target.
- `refresh_interval` is one of the supported values in current docs.
- Secrets are represented as custom fields, not literals.
- `polling_headers` and `polling_url` use custom field interpolation where needed.

## Layout

- Full view has enough hierarchy for quick scanning.
- Half-horizontal and half-vertical views are not just cropped full views.
- Quadrant view keeps only the highest-value signal.
- Long text is clamped or reduced.
- Tables and lists have an empty state.
- Time zones and locale-sensitive display use `trmnl.user` values when available.

## Verification

Run:

```sh
./scripts/validate-recipe.sh recipes/<slug>
./scripts/preview-recipe.sh recipes/<slug>
```

For release/export:

```sh
./scripts/export-recipe.sh recipes/<slug>
```

Then import the ZIP in TRMNL or push with `trmnlp` when authenticated.

