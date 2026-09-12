-- Claude Code integration: drives the `claude` CLI you're already authed into.
-- No ANTHROPIC_API_KEY needed; it reuses your Claude Code login/plan.
require("claudecode").setup({
  terminal = {
    provider = "native", -- use nvim's built-in terminal (avoids a snacks.nvim dependency)
    split_side = "right",
    split_width_percentage = 0.35,
  },
})

-- Keymaps under <leader>a (AI). Commands verified against the installed plugin.
local map = vim.keymap.set
-- ClaudeCodeFocus: focuses the panel when you're elsewhere, hides it when you're in it.
-- This is the smart toggle — use it for everything.
map("n", "<leader>ac", "<cmd>ClaudeCodeFocus<cr>",      { desc = "Claude: toggle / focus", silent = true })
map("t", "<leader>ac", "<cmd>ClaudeCodeFocus<cr>",      { desc = "Claude: hide (from inside)", silent = true })
map("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",      { desc = "Claude: add current file as context", silent = true })
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>",       { desc = "Claude: send selection", silent = true })
map("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>",{ desc = "Claude: pick model", silent = true })
-- When Claude proposes an edit it opens a diff — accept or reject it:
map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Claude: accept diff", silent = true })
map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   { desc = "Claude: reject diff", silent = true })

-- In the nvim-tree file explorer, add the file/dir under the cursor as context.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function(ev)
    vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>",
      { buffer = ev.buf, desc = "Claude: add tree file as context", silent = true })
  end,
})
