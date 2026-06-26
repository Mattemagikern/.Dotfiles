local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim....')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable', -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end

	-- You can "comment out" the line below after lazy.nvim is installed
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)

	require('lazy').setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
	{'tpope/vim-fugitive'},
	{'nvim-tree/nvim-tree.lua'},
	{'loctvl842/monokai-pro.nvim'},

	{'nvim-telescope/telescope.nvim'},
	{'github/copilot.vim'},
	{'folke/tokyonight.nvim', lazy = false, priority = 1000, opts = {}, },
	{'Junegunn/vim-easy-align'},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		dependencies = { 'nvim-lua/plenary.nvim' },
		build = ":TSUpdate",
		prefer_git = true,
		ignore_install = { "tree-sitter-ipkg" },
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				sync_install = true,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
			})
		end
	},
	{'nvim-tree/nvim-web-devicons'},
	{
	  'pwntester/octo.nvim',
	  dependencies = {
	    'nvim-lua/plenary.nvim',
	    'nvim-telescope/telescope.nvim',
	    'nvim-tree/nvim-web-devicons',
	  },
	  config = function()
	    require('octo').setup({
	      picker = 'telescope',
	      use_local_fs = true,
	      mappings = {
		review_diff = {
		  select_next_entry = { lhs = '<C-n>', desc = 'next changed file' },
		  select_prev_entry = { lhs = '<C-p>', desc = 'prev changed file' },
		},
		file_panel = {
		  select_next_entry = { lhs = '<C-n>', desc = 'next changed file' },
		  select_prev_entry = { lhs = '<C-p>', desc = 'prev changed file' },
		},
	      },
	    })
	  end,
	}
})
require("nvim-treesitter.install").prefer_git = true
require('telescope').setup {
	defaults = {
		file_ignore_patterns = {},
		prompt_prefix = "🔍",
	},
	pickers = {
		find_files = {
			no_ignore = true,
		}
	}
}
local builtin = require('telescope.builtin')

local function tune_diff_hl()
  vim.api.nvim_set_hl(0, 'DiffAdd',    { bg = '#1d3b2a' })
  vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#3b1d22', fg = '#6b3138' })
  vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#23262e' })
  vim.api.nvim_set_hl(0, 'DiffText',   { bg = '#37414f' })
end
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', callback = tune_diff_hl })

tune_diff_hl()
vim.g.mapleader=' '
vim.g.maplocalleader=' '

vim.keymap.set('n', 'db', ':bd<CR>', {})
vim.keymap.set('n', 'e<space>', ':e ', {})
vim.keymap.set('n', 'Y', 'y$', {})
vim.keymap.set('n', 'D', 'd$', {})
vim.keymap.set('n', '<C-a>', ':buffer term<TAB><CR>', {})
vim.keymap.set('t', '<C-a>', '<C-\\><C-N>', {})
vim.keymap.set('i', 'hh', '<ESC>', {})

vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '/', builtin.current_buffer_fuzzy_find , {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>gd', ':Gdiff<CR>', {})
vim.keymap.set('n', '<leader>n', ':tag<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gt', '<C-]>', { noremap = true, desc = "Go to tag" })

vim.keymap.set('n', '<leader>pl', ':Octo pr list<CR>', {})
vim.keymap.set('n', '<leader>pv', ':Octo search is:pr is:open review-requested:@me<CR>', {})
vim.keymap.set('n', '<leader>pr', ':Octo review start<CR>', {})
vim.keymap.set('n', '<leader>ps', ':Octo review submit<CR>', {})
vim.keymap.set('n', '<leader>pc', ':Octo pr checkout<CR>', {})

vim.keymap.set('n', 'ciwp', 'ciw<C-R>0<ESC>b', {})
vim.keymap.set('n', 'cw', 'ciw', {})
vim.opt.fixeol      = false
vim.opt.smartcase   = true
vim.opt.ignorecase  = true
vim.opt.hlsearch    = false
vim.opt.breakindent = true
vim.opt.linebreak   = true
vim.opt.tabstop     = 8
vim.opt.shiftwidth  = 8
vim.opt.expandtab   = false
vim.opt.undofile    = true
vim.opt.undodir     = vim.fn.expand('~/.nvimundo/')
vim.opt.signcolumn  = "yes:1"

vim.opt.diffopt = {
	'vertical',   -- Vertical diff for side-by-side
	'iwhite',     -- Ignore whitespace changes
	'algorithm:histogram',  -- Use the histogram diff algorithm
	'indent-heuristic'  -- Better handling of diffs in indented code
}

vim.opt.tags          = './tags,tags'  -- In Lua for Neovim
vim.opt.termguicolors = true
vim.cmd.colorscheme('monokai-pro')
vim.api.nvim_set_option("clipboard","unnamedplus")

vim.g.copilot_filetypes = {
	gitcommit = true,
}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = {"*"},
	callback = function(ev)
		save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*jenkinsfile*",
	callback = function()
		vim.bo.filetype = "groovy"
	end,
})
