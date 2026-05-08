# Project Management

## Boards

Suggested labels:

- `recipe`: private plugin or Recipe work
- `public-plugin`: hosted/OAuth plugin work
- `research`: source discovery or feasibility
- `build`: implementation
- `qa`: validation and preview
- `blocked`: needs credentials, API access, or product decision
- `privacy`: secrets, PII, or data exposure concerns

## Definition of Ready

- Desired screen outcome is clear.
- Data source and update cadence are named.
- Auth and secrets handling are understood.
- Target plugin path is chosen: static, polling, webhook, serverless, screenshot, public plugin, or BYOS.
- Acceptance criteria cover all four layouts.

## Definition of Done

- Recipe validates with `./scripts/validate-recipe.sh`.
- Local preview has been checked when layout changed.
- Sample data is anonymous.
- README or recipe notes list setup fields.
- Export ZIP is generated only when needed and is not committed by default.

## Issue Triage

Every recipe issue should end with one of:

- build as static/polling/webhook Recipe
- use screenshot plugin
- needs hosted public plugin
- out of scope because data access, auth, or display constraints do not fit

