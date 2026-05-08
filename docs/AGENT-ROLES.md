# Agent Roles

This repo provides local project agents for Claude Code and portable skills for Codex-style use.

## Claude Agents

- `trmnl-product-manager`: turns ideas into scoped recipe/plugin briefs.
- `trmnl-researcher`: checks TRMNL docs, recipes, public examples, and source APIs.
- `trmnl-recipe-developer`: implements Liquid, settings, sample data, and scripts.
- `trmnl-quality-reviewer`: validates structure, privacy, layout, and publishing readiness.

## Portable Skills

- `trmnl-recipe-research`: source-grounded research workflow.
- `trmnl-recipe-build`: recipe implementation workflow.
- `trmnl-recipe-qa`: validation and release-readiness workflow.
- `trmnl-public-plugin-plan`: planning workflow for hosted public plugins.

## Collaboration Pattern

1. Product manager defines the target user, glanceable outcome, data source, and constraints.
2. Researcher verifies current TRMNL docs and looks for prior art.
3. Developer creates or updates recipe files.
4. Quality reviewer runs checks and identifies publishing risks.

Keep handoffs concrete: file paths, source links, open questions, and validation commands.

