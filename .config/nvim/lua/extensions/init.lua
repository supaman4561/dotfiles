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
	},
	{ "nvim-lua/plenary.nvim" },

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

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
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
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

	{ "lewis6991/gitsigns.nvim" },

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

	-- git
	{ "airblade/vim-gitgutter" },

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{ "towolf/vim-helm" },

	-- Helpers
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	build = "cd app && npm install",
	-- 	init = function() vim.g.mkdp_filetypes = { "markdown" } end,
	-- 	ft = { "markdown" },
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
		opts = {
			show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
			debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
			disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
			language = "Japanese", -- Copilot answer language settings when using default prompts. Default language is English.
			-- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
			-- temperature = 0.1,
		},
		build = function()
			vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
		end,
		event = "VeryLazy",
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
			{ "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
			{ "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
			{
				"<leader>ccT",
				"<cmd>CopilotChatVsplitToggle<cr>",
				desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
			},
			{
				"<leader>ccv",
				":CopilotChatVisual ",
				mode = "x",
				desc = "CopilotChat - Open in vertical split",
			},
			{
				"<leader>ccx",
				":CopilotChatInPlace<cr>",
				mode = "x",
				desc = "CopilotChat - Run in-place code",
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
