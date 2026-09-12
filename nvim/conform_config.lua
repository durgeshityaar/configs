-- Single source of truth for format-on-save.
-- Web filetypes -> prettier (project-local preferred). Go -> LSP fallback
-- (gopls with gofumpt=true), so no separate gofumpt/goimports binary is needed.
local prettier = { "prettierd", "prettier", stop_after_first = true }

require("conform").setup({
  formatters_by_ft = {
    javascript = prettier,
    javascriptreact = prettier,
    typescript = prettier,
    typescriptreact = prettier,
    json = prettier,
    jsonc = prettier,
    css = prettier,
    scss = prettier,
    html = prettier,
    yaml = prettier,
    markdown = prettier,
    -- Go intentionally omitted -> falls through to the LSP formatter (gopls).
  },
  format_on_save = {
    -- If no conform formatter is configured for the filetype, use the LSP
    -- formatter instead (this is what formats Go via gopls/gofumpt).
    lsp_format = "fallback",
    timeout_ms = 2000,
  },
})

-- Manual format command that mirrors the on-save behavior.
vim.api.nvim_create_user_command("Format", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format current buffer (conform, LSP fallback)" })
