local vim = vim

-- Set leader key FIRST
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '

local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('rebelot/kanagawa.nvim')
Plug('kyazdani42/nvim-tree.lua')
Plug('kyazdani42/nvim-web-devicons')
Plug('romgrk/barbar.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate', ['branch'] = 'master'})
-- LSP
Plug('neovim/nvim-lspconfig')
-- Completion plugins
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
-- Telescope
Plug('nvim-lua/plenary.nvim') --for fzf
Plug('nvim-telescope/telescope.nvim', { [ 'tag' ] = '0.1.4' })
Plug('ibhagwan/fzf-lua', {['branch'] = 'main'})
Plug('rmagatti/auto-session')
-- comment
Plug('numToStr/Comment.nvim')
-- interface for dsiplaying errors
Plug('folke/trouble.nvim')

-- git-blame
Plug 'f-person/git-blame.nvim'
-- git signs (gutter + staged/changed highlighting)
Plug('lewis6991/gitsigns.nvim')
-- git review UI: side-by-side diffs + file history, and magit-style status/tree
Plug('sindrets/diffview.nvim')
Plug('NeogitOrg/neogit')
-- GitHub PRs/issues inside neovim (review, inline comments, approve)
Plug('pwntester/octo.nvim')
-- Claude Code integration (drives the authed `claude` CLI from nvim)
Plug('coder/claudecode.nvim')

-- editing essentials
Plug('windwp/nvim-autopairs')
Plug('windwp/nvim-ts-autotag')
Plug('nvim-treesitter/nvim-treesitter-textobjects', {['branch'] = 'master'})

-- formatting
Plug('stevearc/conform.nvim')

-- debugging (DAP)
Plug('mfussenegger/nvim-dap')
Plug('nvim-neotest/nvim-nio')
Plug('rcarriga/nvim-dap-ui')
Plug('leoluz/nvim-dap-go')

-- go ecosystem tools
Plug('ray-x/guihua.lua', {['do'] = 'cd lua/fzy && make'})
Plug('ray-x/go.nvim')

-- tool manager + quality of life
Plug('williamboman/mason.nvim')
Plug('folke/which-key.nvim')
Plug('lukas-reineke/indent-blankline.nvim')

vim.call('plug#end')

home=os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.colorcolumn = ''

-- Load configs
require"common"
require"theme"
require"treesitter"
require"vimtree"
require"barbar"
require"lua_line"
require"mason_config"
require"lsp"
require"cmp_config"
require"combinations"
require"telescope_config"
require"autosession"
require"comment_config"
require"trouble_config"
require"gitsigns_config"
require"git_ui"
require"octo_config"
require"editing"
require"conform_config"
require"dap_config"
require"go_config"
require"whichkey_config"
require"indent_config"
require"claudecode_config"
