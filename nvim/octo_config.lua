-- Octo: review GitHub PRs/issues without leaving Neovim.
-- Uses the gh CLI (already authed) + fzf-lua for pickers + diffview for diffs.
require("octo").setup({
  picker = "fzf-lua",
  default_merge_method = "squash",
  suppress_missing_scope = { projects_v2 = true }, -- silence warning if token lacks projects scope
})

-- Entry points under <leader>o (Octo). Inside a PR/review buffer, Octo adds its
-- own local maps: <space>ca add comment, <space>ct add thread, review submit, etc.
local map = vim.keymap.set
local function opts(desc) return { desc = desc, silent = true } end
-- lowercase = browse/list, UPPERCASE = create
map("n", "<leader>op", "<cmd>Octo pr list<cr>",      opts("Octo: list PRs"))
map("n", "<leader>oP", "<cmd>Octo pr create<cr>",    opts("Octo: create PR from current branch"))
map("n", "<leader>oc", "<cmd>Octo pr checkout<cr>",  opts("Octo: checkout current PR"))
map("n", "<leader>or", "<cmd>Octo review start<cr>", opts("Octo: start review"))
map("n", "<leader>oR", "<cmd>Octo review submit<cr>",opts("Octo: submit review"))
map("n", "<leader>oi", "<cmd>Octo issue list<cr>",   opts("Octo: list issues"))
map("n", "<leader>oI", "<cmd>Octo issue create<cr>", opts("Octo: create issue"))
