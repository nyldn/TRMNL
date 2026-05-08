# gh Claude Guidance

This project develops TRMNL Recipes and plugins.

Use the project agents in `.claude/agents` when work naturally separates into planning, research, development, or QA. Use slash-command prompts in `.claude/commands` for repeatable Claude Code workflows.

Important entry points:

- `docs/TRMNL-RESEARCH.md` for current TRMNL source links and constraints
- `docs/RECIPE-CHECKLIST.md` for recipe readiness checks
- `docs/AGENT-ROLES.md` for project agent responsibilities
- `scripts/new-recipe.sh` to create recipe source from the template
- `scripts/validate-recipe.sh` before commit or export
- `scripts/preview-recipe.sh` for local preview via `trmnlp`
- `scripts/export-recipe.sh` for flat ZIP exports

Do not put secrets, private webhook URLs, or real user payloads in the repository.

