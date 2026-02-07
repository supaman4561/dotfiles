local cmp = require("cmp")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

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
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	}),
	experimental = {
		ghost_text = false,
	},
})

-- autopairs との統合
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)
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
