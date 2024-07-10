local telescope = require("telescope")
telescope.load_extension("notify")

vim.keymap.set("n", "<leader>fn", function()
	telescope.extensions.notify.notify()
end)

require("notify").setup({
	-- background_colour = "#000000",
})
