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
	{'scrooloose/nerdtree'},
	{'tpope/vim-fugitive'},
	{'nvim-lua/plenary.nvim'},
	{'nvim-telescope/telescope.nvim'},
	{'haya14busa/vim-keeppad'},
	{'github/copilot.vim'},
	{'folke/tokyonight.nvim', lazy = false, priority = 1000, opts = {}, },
	{
		'https://gitlab.com/itaranto/plantuml.nvim',
		version = '*',
		config = {
			renderer = {
				type = 'image',
				options = {
					prog = 'feh',
					dark_mode = true,
				}
			},
			render_on_write = true,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = "all",
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
			})
		end
	}
})

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

vim.g.mapleader=' '

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

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.breakindent = true
vim.opt.linebreak=true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = false
vim.opt.undofile=true
vim.opt.undodir=vim.fn.expand('~/.nvimundo/')

vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight-moon')
vim.api.nvim_set_option("clipboard","unnamedplus")


vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = {"*"},
	callback = function(ev)
		save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})

vim.filetype.add({
	extension = {
		jenkins = 'perl',
	}
})

