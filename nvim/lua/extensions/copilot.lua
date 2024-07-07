require("copilot").setup({
	suggestion = { enable = false },
	panel = { enabled = false },
})

vim.api.nvim_create_user_command("Takeoff", function()
	vim.notify("Cleared for Takeoff!")
end, {})

vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
	["*"] = false,
	["javascript"] = true,
	["typescript"] = true,
	["lua"] = true,
	["rust"] = true,
	["c"] = true,
	["c#"] = true,
	["c++"] = true,
	["go"] = true,
	["python"] = true,
	["markdown"] = true,
}
