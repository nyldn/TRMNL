# gh

TRMNL recipe and plugin development workspace.

This repository is set up for building, reviewing, and publishing TRMNL private plugins, community Recipes, and higher-effort public plugin ideas. It includes:

- TRMNL-compatible recipe templates under `recipes/`
- scripts for scaffolding, validating, previewing, and exporting recipes
- Claude Code project agents under `.claude/agents`
- slash-command prompts under `.claude/commands`
- portable Codex-style skills under `skills/`
- research notes that point future agents at current TRMNL docs and source repositories

## Quick Start

```sh
./scripts/new-recipe.sh my-recipe
./scripts/validate-recipe.sh recipes/my-recipe
./scripts/preview-recipe.sh recipes/my-recipe
./scripts/export-recipe.sh recipes/my-recipe
```

`preview-recipe.sh` uses `bin/trmnlp` inside the recipe. The wrapper runs a local `trmnlp` command when available, then falls back to Docker with the official `trmnl/trmnlp` image.

## Repository Layout

```text
.
├── recipes/
│   ├── _template/              # Starter recipe copied by scripts/new-recipe.sh
│   └── examples/daily-quote/   # Minimal complete static recipe
├── scripts/
│   ├── new-recipe.sh
│   ├── validate-recipe.sh
│   ├── preview-recipe.sh
│   └── export-recipe.sh
├── skills/                     # Portable skills for Codex or other agents
├── .claude/
│   ├── agents/                 # Claude Code project agents
│   └── commands/               # Claude slash-command prompt files
└── docs/
    ├── TRMNL-RESEARCH.md
    ├── RECIPE-CHECKLIST.md
    ├── AGENT-ROLES.md
    └── PROJECT-MANAGEMENT.md
```

## Development Notes

- Private Plugins and Recipes are Liquid-based. Use polling, webhook, static, or plugin-merge data strategies before reaching for hosted public plugin infrastructure.
- Keep recipe ZIP exports flat: `settings.yml` plus layout `.liquid` files.
- Put secrets in TRMNL custom fields or local environment variables, not committed files.
- Test all four TRMNL layout files: `full`, `half_horizontal`, `half_vertical`, and `quadrant`.
- Check payload size and refresh cadence before picking webhook or polling.

## Core References

- TRMNL Recipes: https://trmnl.com/recipes
- Open source TRMNL plugins: https://github.com/usetrmnl/plugins
- TRMNL private plugin guide: https://help.trmnl.com/en/articles/9510536-private-plugins
- Import/export format: https://help.trmnl.com/en/articles/10542599-importing-and-exporting-private-plugins
- Custom fields: https://help.trmnl.com/en/articles/10513740-custom-plugin-form-builder
- Webhook API: https://docs.trmnl.com/go/private-plugins/webhooks
- Local preview server: https://github.com/usetrmnl/trmnlp
- TRMNL framework docs: https://trmnl.com/framework/docs/v3/view

