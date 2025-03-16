local catppuccin = require('catppuccin')

catppuccin.setup({
	flavour = "frappe", -- latte, frappe, macchiato, mocha
	transparent_background = true,
	integrations = {
		cmp = true,
		notify = true,
		noice = true,
	}
})
