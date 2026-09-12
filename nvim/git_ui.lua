-- Diffview: side-by-side review of diffs, merges, and file/branch history
require("diffview").setup({
  enhanced_diff_hl = true, -- clearer intra-line highlighting
  view = {
    -- 3-way layout when resolving merge conflicts
    merge_tool = { layout = "diff3_mixed" },
  },
})

-- Neogit: magit-style status/tree, staging, commit, and a log/commit graph.
-- Pressing <Enter> on a file in the status buffer opens it in Diffview.
require("neogit").setup({
  integrations = { diffview = true },
  graph_style = "unicode", -- prettier commit graph in the log view
})

-- Keymaps live under <leader>h (your git prefix; <leader>g is live-grep).
-- These don't collide with the gitsigns hunk maps (hs/hr/hS/hR/hp/hb/hd).
local map = vim.keymap.set
map("n", "<leader>hn", "<cmd>Neogit<cr>",                { desc = "Neogit: status / tree", silent = true })
map("n", "<leader>ho", "<cmd>DiffviewOpen<cr>",          { desc = "Diffview: review working changes", silent = true })
map("n", "<leader>hf", "<cmd>DiffviewFileHistory %<cr>", { desc = "Diffview: this file's history", silent = true })
map("n", "<leader>hF", "<cmd>DiffviewFileHistory<cr>",   { desc = "Diffview: repo history", silent = true })
map("n", "<leader>hc", "<cmd>DiffviewClose<cr>",         { desc = "Diffview: close", silent = true })
