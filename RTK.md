# RTK - Rust Token Killer

Use RTK selectively for shell commands that would otherwise dump noisy output into context.

Prefer native commands when they are already concise:

```sh
rg "pattern" src
rg --files
sed -n '1,120p' file
awk '...'
```

Use `rtk` for high-noise commands:

```sh
rtk git status
rtk git diff
rtk gh pr diff
rtk find . -name "*.liquid"
rtk npm run build
```

Do not prefix every command with `rtk`. Use it when compression improves signal.
