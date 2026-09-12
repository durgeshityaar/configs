require('gitsigns').setup({
  -- Signs for UNstaged changes (shown in the gutter / sign column)
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  -- Distinct signs for STAGED changes, so you can tell staged from unstaged
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  signs_staged_enable = true,
  signcolumn = true,   -- show signs in the sign column
  numhl      = false,  -- set true to also tint the line number
  current_line_blame = false, -- git-blame.nvim already handles inline blame

  on_attach = function(bufnr)
    local gs = require('gitsigns')
    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, silent = true })
    end

    -- Navigate between changed hunks
    map('n', ']c', function() gs.nav_hunk('next') end, 'Git: next hunk')
    map('n', '[c', function() gs.nav_hunk('prev') end, 'Git: prev hunk')

    -- Stage / reset / preview hunks
    map('n', '<leader>hs', gs.stage_hunk, 'Git: stage hunk')
    map('n', '<leader>hr', gs.reset_hunk, 'Git: reset hunk')
    map('n', '<leader>hS', gs.stage_buffer, 'Git: stage buffer')
    map('n', '<leader>hR', gs.reset_buffer, 'Git: reset buffer')
    map('n', '<leader>hp', gs.preview_hunk, 'Git: preview hunk')
    map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, 'Git: blame line')
    map('n', '<leader>hd', gs.diffthis, 'Git: diff against index')
  end,
})
