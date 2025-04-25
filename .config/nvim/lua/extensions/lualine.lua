local config = {
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		-- component_separators = { left = '', right = ''},
		component_separators = { left = "", right = "" },
		-- section_separators = { left = '', right = ''},
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			"mode",
		},
		lualine_b = {
			{
				"filename",
				newfile_status = true,
				path = 1, -- relative path
				shorting_target = 24,
			},
			{
				"branch",
				color = { fg = "#f2c23d" },
			},
			"diff"
		},
		lualine_c = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic", "nvim_lsp" },
				sections = { "error", "warn", "info", "hint" },
				symbols = { error = " ", warn = " ", info = " ", hint = "?" },
			},
			{ "navic" },
		},
		lualine_x = {
			"encoding",
			{
				-- Lsp server name .
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icon = "󰿘 ",
				color = { fg = "#1ddbb3", gui = "bold" },
			},
		},
		lualine_y = {
			"filetype",
		},
		lualine_z = { "fileformat" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
}

require("lualine").setup(config)
