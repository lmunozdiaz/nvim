local M = {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver", "jsonls", "html", "cssls", "emmet_ls", "marksman", "sqlls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- local lspconfig = require("lspconfig")
			-- lspconfig.lua_ls.setup({})
			-- lspconfig.tsserver.setup({})
			-- lspconfig.jsonls.setup({})
			-- lspconfig.html.setup({})
			-- lspconfig.cssls.setup({})
			-- lspconfig.emmet_ls.setup({})
			-- lspconfig.marksman.setup({})
			-- lspconfig.sqlls.setup({})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.sqlls.setup({
				capabilities = capabilities,
			})

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
					vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {})
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {})
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, {})
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
					vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
				end,
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
			local event = "BufWritePre" -- or "BufWritePost"
			local async = event == "BufWritePost"

			null_ls.setup({
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.keymap.set("n", "<Leader>gf", function()
							vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
						end, { buffer = bufnr, desc = "[lsp] format" })

						-- format on save
						vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
						vim.api.nvim_create_autocmd(event, {
							buffer = bufnr,
							group = group,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr, async = async })
							end,
							desc = "[lsp] format on save",
						})
					end

					if client.supports_method("textDocument/rangeFormatting") then
						vim.keymap.set("x", "<Leader>gf", function()
							vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
						end, { buffer = bufnr, desc = "[lsp] format" })
					end
				end,
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
				},
			})
		end,
	},
}

return M
