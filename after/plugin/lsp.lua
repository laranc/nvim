local lsp = require("lspconfig")
local cmp = require("cmp")
local mason_lsp = require("mason-lspconfig")

require("mason").setup({})

mason_lsp.setup({
	ensure_installed = { "lua_ls", "clangd", "gopls", "zls", "ols" },
})

local defaults = lsp.util.default_config
defaults.capabilities = vim.tbl_deep_extend(
	"force",
	defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

mason_lsp.setup_handlers({
	function(server)
		if server == "lua_ls" then
			lsp.lua_ls.setup({
				settings = {
					Lua = {
						workspace = {
							userThirdParty = { os.getenv("HOME") .. ".local/share/LuaAddons" },
							checkThirdParty = "Apply",
						},
					},
				},

			})
		else
			lsp[server].setup({})
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local id = vim.tbl_get(event, "data", "client_id")
		local client = id and vim.lsp.get_client_by_id(id)
		if client == nil then
			return
		end
		if client.supports_method("textDocument/formatting") then
			require("lsp-format").on_attach(client)
		end
	end,
})

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})

require("autoclose").setup({})
