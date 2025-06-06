-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', { 'nvim-0.5' }) ~= 1 then
	vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
	return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()
	_G._packer = _G._packer or {}
	_G._packer.inside_compile = true

	local time
	local profile_info
	local should_profile = false
	if should_profile then
		local hrtime = vim.loop.hrtime
		profile_info = {}
		time = function(chunk, start)
			if start then
				profile_info[chunk] = hrtime()
			else
				profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
			end
		end
	else
		time = function(chunk, start) end
	end

	local function save_profiles(threshold)
		local sorted_times = {}
		for chunk_name, time_taken in pairs(profile_info) do
			sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
		end
		table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
		local results = {}
		for i, elem in ipairs(sorted_times) do
			if not threshold or threshold and elem[2] > threshold then
				results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
			end
		end
		if threshold then
			table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
		end

		_G._packer.profile_output = results
	end

	time([[Luarocks path setup]], true)
	local package_path_str =
	"/home/spmn/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?.lua;/home/spmn/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?/init.lua;/home/spmn/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?.lua;/home/spmn/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?/init.lua"
	local install_cpath_pattern = "/home/spmn/.cache/nvim/packer_hererocks/2.1.1692716794/lib/lua/5.1/?.so"
	if not string.find(package.path, package_path_str, 1, true) then
		package.path = package.path .. ';' .. package_path_str
	end

	if not string.find(package.cpath, install_cpath_pattern, 1, true) then
		package.cpath = package.cpath .. ';' .. install_cpath_pattern
	end

	time([[Luarocks path setup]], false)
	time([[try_loadstring definition]], true)
	local function try_loadstring(s, component, name)
		local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
		if not success then
			vim.schedule(function()
				vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result,
					vim.log.levels.ERROR, {})
			end)
		end
		return result
	end

	time([[try_loadstring definition]], false)
	time([[Defining packer_plugins]], true)
	_G.packer_plugins = {
		["Comment.nvim"] = {
			config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/Comment.nvim",
			url = "https://github.com/numToStr/Comment.nvim"
		},
		["cmp-nvim-lsp"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
			url = "https://github.com/hrsh7th/cmp-nvim-lsp"
		},
		["emmet-vim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/emmet-vim",
			url = "https://github.com/mattn/emmet-vim"
		},
		["fern-git-status.vim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/fern-git-status.vim",
			url = "https://github.com/lambdalisue/fern-git-status.vim"
		},
		["fern-renderer-nerdfont.vim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/fern-renderer-nerdfont.vim",
			url = "https://github.com/lambdalisue/fern-renderer-nerdfont.vim"
		},
		["fern.vim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/fern.vim",
			url = "https://github.com/lambdalisue/fern.vim"
		},
		["fidget.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/fidget.nvim",
			url = "https://github.com/j-hui/fidget.nvim"
		},
		["gitsigns.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
			url = "https://github.com/lewis6991/gitsigns.nvim"
		},
		["glyph-palette.vim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/glyph-palette.vim",
			url = "https://github.com/lambdalisue/glyph-palette.vim"
		},
		["lualine.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/lualine.nvim",
			url = "https://github.com/nvim-lualine/lualine.nvim"
		},
		["markdown-preview.nvim"] = {
			loaded = false,
			needs_bufread = false,
			only_cond = false,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
			url = "https://github.com/iamcco/markdown-preview.nvim"
		},
		["mason-lspconfig.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
			url = "https://github.com/williamboman/mason-lspconfig.nvim"
		},
		["mason.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/mason.nvim",
			url = "https://github.com/williamboman/mason.nvim"
		},
		["nerdfont.vim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/nerdfont.vim",
			url = "https://github.com/lambdalisue/nerdfont.vim"
		},
		["noice.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/noice.nvim",
			url = "https://github.com/folke/noice.nvim"
		},
		["none-ls.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/none-ls.nvim",
			url = "https://github.com/nvimtools/none-ls.nvim"
		},
		["nui.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/nui.nvim",
			url = "https://github.com/MunifTanjim/nui.nvim"
		},
		["nvim-autopairs"] = {
			config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
			url = "https://github.com/windwp/nvim-autopairs"
		},
		["nvim-cmp"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/nvim-cmp",
			url = "https://github.com/hrsh7th/nvim-cmp"
		},
		["nvim-colorizer.lua"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
			url = "https://github.com/norcalli/nvim-colorizer.lua"
		},
		["nvim-lspconfig"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
			url = "https://github.com/neovim/nvim-lspconfig"
		},
		["nvim-notify"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/nvim-notify",
			url = "https://github.com/rcarriga/nvim-notify"
		},
		["nvim-treesitter"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
			url = "https://github.com/nvim-treesitter/nvim-treesitter"
		},
		["nvim-ts-autotag"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
			url = "https://github.com/windwp/nvim-ts-autotag"
		},
		["nvim-web-devicons"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
			url = "https://github.com/nvim-tree/nvim-web-devicons"
		},
		["packer.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/packer.nvim",
			url = "https://github.com/wbthomason/packer.nvim"
		},
		["plenary.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/plenary.nvim",
			url = "https://github.com/nvim-lua/plenary.nvim"
		},
		["telescope-fzf-native.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
			url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
		},
		["telescope.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/telescope.nvim",
			url = "https://github.com/nvim-telescope/telescope.nvim"
		},
		["tokyonight.nvim"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
			url = "https://github.com/folke/tokyonight.nvim"
		},
		["vim-devicons"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/vim-devicons",
			url = "https://github.com/ryanoasis/vim-devicons"
		},
		["vim-floaterm"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/vim-floaterm",
			url = "https://github.com/voldikss/vim-floaterm"
		},
		["vim-gitgutter"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
			url = "https://github.com/airblade/vim-gitgutter"
		},
		["vim-helm"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/vim-helm",
			url = "https://github.com/towolf/vim-helm"
		},
		["vim-hybrid-material"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/vim-hybrid-material",
			url = "https://github.com/kristijanhusak/vim-hybrid-material"
		},
		["vim-tmux-navigator"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
			url = "https://github.com/christoomey/vim-tmux-navigator"
		},
		["vim-vsnip"] = {
			loaded = true,
			path = "/home/spmn/.local/share/nvim/site/pack/packer/start/vim-vsnip",
			url = "https://github.com/hrsh7th/vim-vsnip"
		}
	}

	time([[Defining packer_plugins]], false)
	-- Setup for: markdown-preview.nvim
	time([[Setup for markdown-preview.nvim]], true)
	try_loadstring(
	"\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0",
		"setup", "markdown-preview.nvim")
	time([[Setup for markdown-preview.nvim]], false)
	-- Config for: nvim-autopairs
	time([[Config for nvim-autopairs]], true)
	try_loadstring(
	"\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0",
		"config", "nvim-autopairs")
	time([[Config for nvim-autopairs]], false)
	-- Config for: Comment.nvim
	time([[Config for Comment.nvim]], true)
	try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0",
		"config", "Comment.nvim")
	time([[Config for Comment.nvim]], false)
	vim.cmd [[augroup packer_load_aucmds]]
	vim.cmd [[au!]]
	-- Filetype lazy-loads
	time([[Defining lazy-load filetype autocommands]], true)
	vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
	time([[Defining lazy-load filetype autocommands]], false)
	vim.cmd("augroup END")

	_G._packer.inside_compile = false
	if _G._packer.needs_bufread == true then
		vim.cmd("doautocmd BufRead")
	end
	_G._packer.needs_bufread = false

	if should_profile then save_profiles() end
end)

if not no_errors then
	error_msg = error_msg:gsub('"', '\\"')
	vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: ' ..
	error_msg .. '" | echom "Please check your config for correctness" | echohl None')
end
