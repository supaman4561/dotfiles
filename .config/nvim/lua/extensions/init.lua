local plugins = {
	{
		"nvimtools/none-ls.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("extensions.mason-lspconfig")
		end,
	},

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter" },
	{ "windwp/nvim-ts-autotag" },

	-- cmp
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("extensions.cmp")
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/vim-vsnip" },
	-- { "hrsh7th/cmp-path" },
	-- { "hrsh7th/cmp-buffer" },
	-- { "hrsh7th/cmp-cmdline" },

	-- color scheme
	{ "kristijanhusak/vim-hybrid-material" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("extensions.colorschemes.tokyonight")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1001,
		config = function()
			require("extensions.colorschemes.catppuccin")
		end,
	},

	-- appearance
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("extensions.nvim-tree")
		end,
	},
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
			"neovim/nvim-lspconfig",
			"lewis6991/gitsigns.nvim",
			"SmiteshP/nvim-navic",
			lazy = true,
		},
		config = function()
			require("extensions.lualine")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.2",
		config = function()
			require("extensions.telescope")
		end,
		keys = {
			{
				"<space>fb",
				"<cmd>Telescope file_browser<cr>",
			}
		}
	},
	{ "nvim-lua/plenary.nvim" },

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},

	{ "ryanoasis/vim-devicons" },

	{ "christoomey/vim-tmux-navigator" },

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({})
		end,
	},

	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"folke/noice.nvim",
		config = function()
			require("extensions.noice")
		end,
	},
	{ "MunifTanjim/nui.nvim" },
	{
		"rcarriga/nvim-notify",
		config = function()
			require("extensions.notify")
		end,
	},


	{ "j-hui/fidget.nvim" },

	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("extensions.nvim-hlslens")
		end,
	},

	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("extensions.nvim-scrollbar")
		end,
		requires = {
			"kevinhwang91/nvim-hlslens",
			"lewis6991/gitsigns.nvim",
		},
	},
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("extensions.nvim-navic")
		end,
		requires = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		'stevearc/dressing.nvim',
		opts = {},
	},

	-- git
	{ "lewis6991/gitsigns.nvim" },

	{ 'akinsho/git-conflict.nvim', version = "*", config = true },

	{ "airblade/vim-gitgutter" },

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{ "towolf/vim-helm" },

	-- Helpers
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	},
	-- {
	-- 	'preservim/vim-markdown',
	-- 	dependencies = {
	-- 		'godlygeek/tabular',
	-- 	}
	-- },
	{ "voldikss/vim-floaterm" },
	{ "mattn/emmet-vim" },
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- copilot
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("extensions.copilot")
		end,
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		build = function()
			vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
		end,
		event = "VeryLazy",
		config = function()
			require("extensions.copilot-chat")
		end,
		keys = {
			{
				"<leader>ccq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					end
				end,
				desc = "CopilotChat - Quick Chat",
			},
			{
				"<leader>cce",
				"<cmd>CopilotChatExplain<cr>",
				desc = "CopilotChat - Explain code"
			},
			{
				"<leader>cct",
				"<cmd>CopilotChatToggle<cr>",
				desc = "CopilotChat - Toggle",
			},
			{
				"<leader>ccf",
				"<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
				desc = "CopilotChat - Fix diagnostic",
			},
			{
				"<leader>ccr",
				"<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
				desc = "CopilotChat - Reset chat history and clear buffer",
			},
			{
				"<leader>ccT",
				"<cmd>CopilotChatTransrate<cr>", -- Translate text in buffer.
				desc = "CopilotChat - Translate buffer text",
			},

		},
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},

	require('extensions.lazygit'),

	require('extensions.render-markdown'),

	require('extensions.avante')
}

local opts = {
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				--'matchparen',
				--'netrwPlugin',
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
