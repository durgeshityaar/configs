local keymap = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- Enable modified keys (required for Ghostty escape sequences)
vim.o.timeout = true
vim.o.timeoutlen = 500

-- cmd+s: save file
keymap("n", "<C-s>", "<cmd>write<cr>", default_opts)
keymap("i", "<C-s>", "<Esc><cmd>write<cr>a", default_opts)

-- cmd+e: scroll down
keymap("n", "<C-e>", "<C-e>", default_opts)

-- cmd+y: scroll up
keymap("n", "<C-y>", "<C-y>", default_opts)

-- cmd+h: previous tab
keymap("n", "<C-h>", "<cmd>BufferPrevious<cr>", default_opts)

-- cmd+l: next tab  
keymap("n", "<C-l>", "<cmd>BufferNext<cr>", default_opts)

-- close current buffer/tab (moved off <C-w> so the native window prefix works:
-- <C-w>h/j/k/l to jump panes, needed for side-by-side diff review)
keymap("n", "<leader>bd", "<cmd>BufferClose<cr>", default_opts)

-- cmd+t: find file in tree
keymap("n", "<C-t>", "<cmd>NvimTreeFindFile<cr>", default_opts)

-- cmd+1: toggle nvim-tree
keymap("n", "<C-1>", "<cmd>NvimTreeToggle<cr>", default_opts)


-- Floating terminal toggle (C-` = scratch terminal, separate from Claude)
local _term_buf = nil
local _term_win = nil

local function toggle_float_term()
  -- If the window is open and visible, hide it
  if _term_win and vim.api.nvim_win_is_valid(_term_win) then
    vim.api.nvim_win_hide(_term_win)
    _term_win = nil
    return
  end

  -- Compute a centred floating window (80% of screen)
  local cols = vim.o.columns
  local rows = vim.o.lines
  local width  = math.floor(cols * 0.8)
  local height = math.floor(rows * 0.8)
  local col    = math.floor((cols - width) / 2)
  local row    = math.floor((rows - height) / 2)

  -- Reuse existing terminal buffer or create a new one
  if not (_term_buf and vim.api.nvim_buf_is_valid(_term_buf)) then
    _term_buf = vim.api.nvim_create_buf(false, true)
  end

  _term_win = vim.api.nvim_open_win(_term_buf, true, {
    relative = "editor",
    width    = width,
    height   = height,
    col      = col,
    row      = row,
    style    = "minimal",
    border   = "rounded",
  })

  -- Start a shell if the buffer has no active job
  if vim.bo[_term_buf].buftype ~= "terminal" then
    vim.fn.termopen(vim.o.shell)
  end

  vim.cmd("startinsert")
end

vim.keymap.set({"n","t"}, "<C-`>", toggle_float_term, { desc = "Toggle floating terminal", silent = true })
-- <Esc><Esc> exits terminal insert mode without closing the window
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal insert mode", silent = true })

-- Trouble keybindings
keymap("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", default_opts)
keymap("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics toggle<cr>", default_opts)
keymap("n", "<leader>td", "<cmd>Trouble document_diagnostics toggle<cr>", default_opts)
keymap("n", "<leader>tq", "<cmd>Trouble quickfix toggle<cr>", default_opts)
keymap("n", "<leader>tc", "<cmd>TroubleClose<cr>", default_opts)
