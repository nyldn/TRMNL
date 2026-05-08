---
name: trmnl-public-plugin-plan
description: Use when planning a hosted public TRMNL plugin that may need OAuth, installation callbacks, management URLs, markup endpoints, uninstallation handling, or server-side operations.
---

# TRMNL Public Plugin Plan

Use this skill when a Recipe/private plugin is not enough.

## First Decision

Confirm why the work cannot be a private plugin, Recipe, webhook, serverless function, or screenshot plugin. Public plugins add hosting, OAuth, install flow, management URLs, and operational risk.

## Planning Checklist

1. Read current TRMNL marketplace/plugin docs.
2. Define endpoints:
   - installation URL
   - installation success webhook URL
   - plugin management URL
   - plugin markup URL
   - uninstallation webhook URL
3. Define auth and token storage.
4. Define per-user settings and data retention.
5. Define throttling/caching for TRMNL markup requests.
6. Define failure screens and support flow.
7. Define local and production verification.

## Output

Produce a concise architecture brief with endpoints, data flow, risks, deployment target, and acceptance criteria. Do not implement until the private-plugin alternatives have been ruled out.

