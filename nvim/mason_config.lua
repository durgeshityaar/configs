-- Mason: in-editor manager for LSP servers, formatters, linters, debuggers.
-- Open the UI with :Mason. Installed tools are added to Neovim's PATH.
-- (Your system gopls/tsserver/etc. still work; nothing is shadowed unless you
--  explicitly install the same tool via Mason.)
require("mason").setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
