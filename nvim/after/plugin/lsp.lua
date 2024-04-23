local lsp = require('lsp-zero')

lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"gopls",
		"clangd",
		"dockerls",
		"rust_analyzer"
	}
})

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.gopls.setup({})
lspconfig.clangd.setup({})
lspconfig.dockerls.setup({})
lspconfig.rust_analyzer.setup({})

local cmp = require('cmp')
local cmp_action = lsp.cmp_action()

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	},
	mapping = cmp.mapping.preset.insert({
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-f>'] = cmp_action.luasnip_jump_forward(),
	['<C-b>'] = cmp_action.luasnip_jump_backward(),
	['<C-a>'] = cmp.mapping.confirm({ select = true })
	})
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)
lsp.setup()


vim.diagnostic.config({
    virtual_text = true
})
