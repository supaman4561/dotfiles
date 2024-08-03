-- lsp
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gf", function()
	vim.lsp.buf.format({
		timeout_ms = 200,
		async = true,
	})
end)
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>bd<CR><cmd>bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { noremap = true, silent = true })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fn", "<cmd>Noice telescope<CR>")

-- floaterm
vim.keymap.set("n", "<leader>t", ":FloatermNew<CR>")

-- NvimTree
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeOpen<CR>")
vim.keymap.set("n", "<C-t>", "<cmd>NvimTreeToggle<CR>")

-- -- trouble
-- vim.keymap.set("n", "<leader>xx", function()
-- 	require("trouble").toggle()
-- end)
-- vim.keymap.set("n", "<leader>xw", function()
-- 	require("trouble").toggle("workspace_diagnostics")
-- end)
-- vim.keymap.set("n", "<leader>xd", function()
-- 	require("trouble").toggle("document_diagnostics")
-- end)
-- vim.keymap.set("n", "<leader>xq", function()
-- 	require("trouble").toggle("quickfix")
-- end)
-- vim.keymap.set("n", "<leader>xl", function()
-- 	require("trouble").toggle("loclist")
-- end)
-- vim.keymap.set("n", "gR", function()
-- 	require("trouble").toggle("lsp_references")
-- end)
--
-- copilot chat
-- vim.keymap.set("n", "<leader>ccb", "<cmd>CopilotChatBuffer<CR>")
-- vim.keymap.set("n", "<leader>cce", "<cmd>CopilotChatExplain<CR>")
-- vim.keymap.set("n", "<leader>cct", "<cmd>CopilotChatTests<CR>")
-- vim.keymap.set("n", "<leader>ccv", ":CopilotChatVisual<CR>")
-- vim.keymap.set("n", "<leader>ccx", ":CopilotChatInPlace<CR>")

--- inc-rename
vim.keymap.set("n", "<leader>rn", ":IncRename ")
