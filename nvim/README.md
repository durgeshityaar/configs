# Neovim Config Reference

Personal nvim setup. Leader key is `<Space>`.

## Architecture

Plugin manager: **vim-plug** (declared in `init.lua`).
Config is split across Lua files all `require`'d from `init.lua`.

## File map

| File | Purpose |
|---|---|
| `init.lua` | Entry point. Declares plugins, sets `<Space>` as leader, loads other configs |
| `common.lua` | Basic settings (line numbers, mouse, no swap, 4-space tabs) |
| `theme.lua` | Loads the **kanagawa** colorscheme |
| `vimtree.lua` | File explorer sidebar (nvim-tree) |
| `barbar.lua` | Tab bar across the top |
| `lua_line.lua` | Status line at the bottom |
| `lsp.lua` | Language servers: TypeScript, ESLint, Python (Pyright). Auto-format on save |
| `cmp_config.lua` | Autocomplete engine |
| `treesitter.lua` | Syntax highlighting |
| `telescope_config.lua` | Configures **fzf-lua** (not telescope, despite the name) for fuzzy finding |
| `autosession.lua` | Auto-save session per directory |
| `comment_config.lua` | `gcc` to toggle comments |
| `trouble_config.lua` | Pretty error/diagnostics list |
| `combinations.lua` | Custom Ctrl-key bindings |

## Keymaps

### Navigation & files (leader = Space)

| Key | Action |
|---|---|
| `<Space>f` | Fuzzy find files |
| `<Space>g` | Live grep (search file contents) |
| `Ctrl-1` | Toggle file tree |
| `Ctrl-t` | Reveal current file in tree |
| `Ctrl-h` / `Ctrl-l` | Previous / next tab (buffer) |
| `Ctrl-w` | Close current tab |
| `Ctrl-s` | Save (works in insert mode too) |

### LSP (code intelligence)

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover docs |
| `<Space>rn` | Rename symbol |
| `<Space>ca` | Code action (quick fix) |
| `<Space>F` | Format file (capital F) |
| `[d` / `]d` | Prev / next diagnostic |
| `gl` | Show diagnostic float |
| `<Ctrl-k>` | Signature help |

Auto-format on save is **on** for any LSP that supports it.

### Trouble (diagnostics panel)

| Key | Action |
|---|---|
| `<Space>tt` | Toggle diagnostics |
| `<Space>tw` | Workspace diagnostics |
| `<Space>td` | Document diagnostics |
| `<Space>tq` | Quickfix list |
| `<Space>tc` | Close |

### Comments

| Key | Action |
|---|---|
| `gcc` | Toggle line comment |
| `gc` (visual) | Toggle block comment |

## Initial setup

After cloning to `~/.config/nvim`:

1. Install vim-plug (if not already installed)
2. Open nvim and run `:PlugInstall`
3. Run `:TSUpdate` to install tree-sitter parsers
4. Make sure language servers are installed on the system:
   - `typescript-language-server` (npm)
   - `vscode-langservers-extracted` (for ESLint)
   - `pyright` (npm or pip)

## Known quirks

- **Tab width**: `init.lua` sets 2 spaces, `common.lua` sets 4. `common.lua` loads later and wins.
- **Telescope listed but unused**: telescope.nvim is installed in `init.lua` but only fzf-lua is configured. Could be removed.

## Learning path

1. Run `vimtutor` in terminal (30 min built-in tutorial)
2. Open nvim, hit `<Space>f`, fuzzy-find a file, edit, `Ctrl-s` to save
3. Drill `hjkl`, `w`/`b`, `dd`, `yy`, `p`, `u`, `:q`, `i`/`a`/`o` until reflexive
4. Layer on LSP (`gd`, `K`, `gr`) once basic editing feels natural
