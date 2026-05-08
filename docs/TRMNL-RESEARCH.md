# TRMNL Research Notes

Last refreshed: 2026-05-08.

## Official Sources

- Recipes directory: https://trmnl.com/recipes
- Open source plugin examples: https://github.com/usetrmnl/plugins
- Private plugin guide: https://help.trmnl.com/en/articles/9510536-private-plugins
- Compare custom plugin types: https://help.trmnl.com/en/articles/10546870-compare-custom-plugin-types
- Import/export private plugins: https://help.trmnl.com/en/articles/10542599-importing-and-exporting-private-plugins
- Custom plugin form builder: https://help.trmnl.com/en/articles/10513740-custom-plugin-form-builder
- Webhooks API: https://docs.trmnl.com/go/private-plugins/webhooks
- Serverless plugins: https://help.trmnl.com/en/articles/14130649-serverless
- Local preview server: https://github.com/usetrmnl/trmnlp
- Framework docs: https://trmnl.com/framework/docs/v3/view

## Working Model

TRMNL has several plugin paths:

- Private Plugin: simplest custom path, Liquid templates with data from polling, webhook, static data, or plugin merge.
- Recipe: a Private Plugin approved/listed publicly by TRMNL. Recipe master changes can propagate to installed copies, so changes need extra care.
- Screenshot plugin: useful when an existing web page already renders well at TRMNL dimensions.
- Third-party public plugin: hosted application with OAuth and TRMNL marketplace integration.
- BYOS: complete server replacement path, outside the normal plugin flow.

Start with Private Plugin or Recipe unless the feature truly needs OAuth, server-side state, or per-user hosting.

## Recipe Source Shape

TRMNL import/export docs describe a flat ZIP with:

- `settings.yml`
- `full.liquid`
- `half_horizontal.liquid`
- `half_vertical.liquid`
- `quadrant.liquid`

The `trmnlp` local dev server uses the same source files under `src/`, plus optional `shared.liquid`, `.trmnlp.yml`, and `bin/trmnlp`.

## settings.yml Basics

Common keys:

- `name`
- `strategy`: `polling`, `webhook`, or `static`
- `refresh_interval`: typically `15`, `60`, `360`, `720`, or `1440`
- `polling_url`, `polling_headers`, `polling_verb` for polling
- `static_data` for static JSON
- `no_screen_padding`: quoted `yes` or `no`
- `dark_mode`: quoted `yes` or `no`
- `custom_fields` for user-facing configuration

Use `custom_fields` for user-supplied secrets and configuration instead of committing values.

## Data Strategies

Polling:

- TRMNL fetches one or more URLs.
- Responses may be JSON, RSS, XML, plaintext, or CSV.
- Multiple polling URL responses are exposed as indexed variables in the editor.
- Headers and body values can interpolate custom field values.

Webhook:

- External automation posts a JSON payload to the plugin setting webhook URL.
- Payload content belongs under `merge_variables`.
- Watch request rate and payload size limits in current API docs before designing data volume.
- `deep_merge` and `stream` can update state incrementally.

Static:

- Useful for examples, prototypes, and recipes with manual data.
- Keep JSON compact and root-level variables easy to use in Liquid.

Serverless:

- Useful for fetching/transformation without a separate server.
- Treat as beta until current TRMNL docs say otherwise.

## Liquid and Framework Notes

- Use Liquid variables, conditionals, loops, and filters.
- Use TRMNL framework classes for layout rather than hand-rolled CSS.
- On the TRMNL platform, plugin markup is automatically wrapped in the correct view container.
- For custom stacks such as BYOS or `trmnlp`, wrappers like `view view--full` may be needed depending on runtime. Keep source compatible with the target path you are using.
- Test all four layouts, especially quadrant and half views where text overflow appears first.

## Open Source Examples

The `usetrmnl/plugins` repository is a reference collection. Native examples are Ruby plus ERB, not direct private-plugin Liquid, but they are useful for:

- data shaping
- screen hierarchy
- layout decisions
- title bars
- how TRMNL thinks about full, half, and quadrant views

The `usetrmnl/trmnlp` repository is the better local-development reference for private-plugin source files.

## Research Checklist

Before building a new recipe:

1. Check whether a similar public plugin or Recipe already exists.
2. Identify the data source, auth model, rate limits, and cache behavior.
3. Decide whether the output can fit in polling/static/webhook without a hosted app.
4. Decide which values must be custom fields.
5. Sketch all four layouts before writing detailed markup.
6. Validate and preview locally before exporting.

