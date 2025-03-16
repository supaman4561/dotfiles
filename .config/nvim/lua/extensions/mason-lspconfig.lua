require('mason-lspconfig').setup_handlers({ function(server)
	local opt = {
		-- Function executed when the LSP server startup
		on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true }
			-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
			-- vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'

			-- if client.resolved_capabilities.document_highlight then
			-- 	vim.cmd 'augroup LspHighlight'
			-- 	vim.cmd 'autocmd!'
			-- 	vim.cmd 'autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()'
			-- 	vim.cmd 'autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()'
			-- 	vim.cmd 'augroup END'
			-- end
			-- helm ls config
			local configs = require('lspconfig.configs')
			local lspconfig = require('lspconfig')
			local util = require('lspconfig.util')

			if not configs.helm_ls then
				configs.helm_ls = {
					default_config = {
						cmd = { "helm_ls", "serve" },
						filetypes = { 'helm' },
						root_dir = function(fname)
							return util.root_pattern('Chart.yaml')(fname)
						end,
					},
				}
			end

			-- lspconfig.terraform_ls.setup {
			-- 	filetypes = { "tf", "tfvars" },
			-- 	cmd = { "terraform-ls", "serve" },
			-- }

			lspconfig.helm_ls.setup {
				filetypes = { "helm" },
				cmd = { "helm_ls", "serve" },
			}

			lspconfig.html.setup {
				settings = {
					html = { format = { indentInnerHtml = true } }
				}
			}
		end,

		capabilities = require('cmp_nvim_lsp').default_capabilities(
			vim.lsp.protocol.make_client_capabilities()
		)
	}
	require('lspconfig')[server].setup(opt)
end })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true }
)
-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
]]

-- Auto Format
vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.format()'
