local catppuccin = require('catppuccin')

catppuccin.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	-- transparent_background = true,
	integrations = {
		cmp = true,
		notify = true,
		noice = true,
		bufferline = true,
	}
})
