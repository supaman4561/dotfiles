local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = 'copilot', max_item_count = 15, keyword_length = 2 },
		{ name = "buffer",  max_item_count = 15, keyword_length = 2 },
		-- { name = "path" },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		['<C-l>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		["<C-f>"] = cmp.mapping.confirm { select = true },
	}),
	experimental = {
		ghost_text = false,
	},
})
-- cmp.setup.cmdline('/', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })
-- cmp.setup.cmdline(":", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = "path" },
--     { name = "cmdline" },
--   },
-- })
--
