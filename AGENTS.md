@RTK.md

# Repository Guidance

This repo is for TRMNL recipe and plugin development. Treat `/Users/chris/git/gh` as a real public repo, not scratch space.

## Default Workflow

1. Start by reading `docs/TRMNL-RESEARCH.md` and `docs/RECIPE-CHECKLIST.md` for TRMNL constraints.
2. For new recipe work, copy `recipes/_template` with `./scripts/new-recipe.sh <slug>`.
3. Keep recipe files compatible with TRMNL private plugin export/import:
   - `src/settings.yml`
   - `src/full.liquid`
   - `src/half_horizontal.liquid`
   - `src/half_vertical.liquid`
   - `src/quadrant.liquid`
4. Validate with `./scripts/validate-recipe.sh <recipe-dir>` before claiming a recipe is ready.
5. Preview with `./scripts/preview-recipe.sh <recipe-dir>` when layout behavior matters.
6. Export with `./scripts/export-recipe.sh <recipe-dir>` only after validation passes.

## Agent Assets

- Claude project agents live in `.claude/agents`.
- Claude slash-command prompts live in `.claude/commands`.
- Portable Codex-style skills live in `skills`.

When a task matches a local skill, read the relevant `skills/<name>/SKILL.md` first. Do not install these globally unless the user asks for global installation.

## Research Rules

TRMNL docs and recipes can change. Verify current docs before making claims about:

- plugin type limitations
- webhook rate limits or payload limits
- `settings.yml` schema
- framework version behavior
- recipe publishing requirements

Prefer official TRMNL docs, `usetrmnl` GitHub repositories, and live recipe pages over old blog posts or forum memory.

## Repo Hygiene

- Do not commit generated recipe ZIP files unless the user asks for release artifacts.
- Do not commit TRMNL API keys, plugin setting UUIDs, webhook URLs, or private payload data.
- Keep recipe source deterministic and readable.
- Leave unrelated files alone.
