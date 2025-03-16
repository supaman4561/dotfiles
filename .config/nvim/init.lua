vim.loader.enable()

vim.api.nvim_set_var("loaded_netrw", 1)
vim.api.nvim_set_var("loaded_netrwPlugin", 1)

-- common settings
local opt = vim.opt
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.clipboard = "unnamed"
opt.emoji = true
opt.termguicolors = true
opt.guifont = "Hack Nerd Font"
opt.cursorline = true
opt.listchars = { tab = "  ", trail = "_" }
opt.list = true

-- vim.cmd([[match NvimInternalError /\(　\|\s\+$\)/]])
vim.cmd([[match NvimInternalError /　/]])

-- indent setting
vim.cmd("autocmd Filetype helm setlocal sw=2 sts=2 ts=2 et")
vim.cmd("autocmd Filetype yaml setlocal sw=2 sts=2 ts=2 et")

-- include lua files
require("extensions")
require("keymaps")

vim.cmd [[ set termguicolors ]]
vim.cmd [[ set splitright ]]
-- tokyonight / catppucin
vim.cmd [[ colorscheme catppuccin ]]
