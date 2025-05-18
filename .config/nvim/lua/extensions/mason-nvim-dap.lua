require('mason-nvim-dap').setup({
	ensure_installed = { 'delve' },
	handlers = {
		function(config)
			require('mason-nvim-dap').default_setup(config)
		end,
		delve = function(config)
			config.adapters = {
				type = 'executable',
				command = 'dlv'
			}
			require('mason-nvim-dap').default_setup(config)
		end,
	},
})
