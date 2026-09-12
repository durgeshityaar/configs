-- ray-x/go.nvim: Go-idiomatic commands on top of gopls.
-- We keep our own gopls setup (lsp.lua) and DAP keymaps (dap_config.lua),
-- so go.nvim is told NOT to configure those.
require("go").setup({
  lsp_cfg = false,          -- gopls is configured in lsp.lua
  lsp_keymaps = false,      -- keep our LSP keymaps
  lsp_inlay_hints = { enable = false }, -- toggle via <leader>ih instead
  lsp_codelens = false,     -- go.nvim's codelens errors on nvim 0.11; leave it off
  lsp_document_formatting = false, -- conform + gopls own formatting/imports
  trouble = true,           -- route reference/quickfix lists to trouble.nvim
  dap_debug = true,
  dap_debug_keymap = false, -- our DAP keymaps live in dap_config.lua
})

-- Go commands under <leader>G (<leader>g is your live-grep, left untouched).
local map = vim.keymap.set
local function opts(desc) return { desc = desc, silent = true } end
map("n", "<leader>Gt", "<cmd>GoTest<cr>",       opts("Go: test package"))
map("n", "<leader>Gf", "<cmd>GoTestFunc<cr>",   opts("Go: test function under cursor"))
map("n", "<leader>Gr", "<cmd>GoRun<cr>",        opts("Go: run"))
map("n", "<leader>Gc", "<cmd>GoCoverage<cr>",   opts("Go: toggle coverage"))
map("n", "<leader>Ge", "<cmd>GoIfErr<cr>",      opts("Go: add if err != nil"))
map("n", "<leader>Gs", "<cmd>GoFillStruct<cr>", opts("Go: fill struct"))
map("n", "<leader>Gj", "<cmd>GoAddTag json<cr>",opts("Go: add json struct tags"))
map("n", "<leader>GJ", "<cmd>GoRmTag json<cr>", opts("Go: remove json struct tags"))
map("n", "<leader>Gi", "<cmd>GoImpl<cr>",       opts("Go: implement interface"))
map("n", "<leader>Gd", "<cmd>GoDoc<cr>",        opts("Go: doc for symbol"))
