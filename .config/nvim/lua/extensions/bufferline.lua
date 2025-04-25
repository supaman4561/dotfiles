vim.opt.termguicolors = true

return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'catppuccin/nvim'
	},
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and "" or ""
					return " " .. icon .. count
				end,
				offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center", padding = 1 } },
				separator_style = "slant",
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				}
			},

		})
	end,
}
