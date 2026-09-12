require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    -- Go
    "go", "gomod", "gosum", "gowork",
    -- TS/JS/web
    "javascript", "typescript", "tsx", "json", "jsonc", "html", "css", "scss",
    -- config / docs / misc
    "yaml", "toml", "markdown", "markdown_inline", "bash", "dockerfile",
    "lua", "vim", "vimdoc", "python", "sql", "regex", "gitignore", "gitcommit",
  },
  auto_install = true, -- install a missing parser when you open that filetype
  highlight = { enable = true },
  incremental_selection = { enable = true },
  -- Requires the nvim-treesitter-textobjects plugin (now installed).
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- jump forward to the next textobject
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["aa"] = "@parameter.outer", -- a function argument
        ["ia"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
    },
  },
}
