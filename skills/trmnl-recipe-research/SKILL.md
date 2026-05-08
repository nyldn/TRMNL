---
name: trmnl-recipe-research
description: Use when researching a TRMNL Recipe or private plugin idea, including current TRMNL docs, existing recipes, data source feasibility, custom fields, webhook/polling limits, and recommended implementation path.
---

# TRMNL Recipe Research

Use this skill before building or scoping a TRMNL Recipe/private plugin.

## Workflow

1. Read `docs/TRMNL-RESEARCH.md` for the source map.
2. Search current TRMNL docs and `https://trmnl.com/recipes` for prior art.
3. Inspect the data source:
   - auth model
   - payload shape
   - rate limits
   - cacheability
   - terms/privacy constraints
4. Choose the lowest-complexity path:
   - `static` for manual/simple examples
   - `polling` for public or authenticated fetches TRMNL can make
   - `webhook` for pushed automation or external transformations
   - `serverless` for lightweight in-platform fetch/transform work if current docs support it
   - `screenshot` when an existing web page already renders well
   - `public plugin` when OAuth, per-user hosting, or marketplace integration is required
5. Produce a short brief with source links, chosen path, custom fields, risks, and acceptance criteria.

## Output

Keep the answer source-grounded and actionable. Include file paths when the research should update repo docs or a recipe.

