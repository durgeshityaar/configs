# zsh

Zsh config, loaded via `$ZDOTDIR` (set in `~/.zshenv`, which points here).

- `.zshenv` — env vars needed by all shell types (login, interactive, scripts)
- `.zprofile` — login-shell setup (Homebrew shellenv, Python/Solana PATH, OrbStack)
- `.zshrc` — interactive setup: Oh My Zsh, starship prompt, history options,
  eza/zoxide aliases, pnpm/nvm/gcloud/bun integration

`.zcompdump*` files are regenerated completion caches — not tracked.
