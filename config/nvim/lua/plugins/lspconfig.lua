require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "zls", "tsserver" }
})

-- Configure completion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configure Zig LSP
local lspconfig = require('lspconfig')
lspconfig.zls.setup{
    capabilities = capabilities
}
lspconfig.tsserver.setup{}

-- Setup nvim-cmp
local cmp = require('cmp')
             cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    --completion = {
    --  autocomplete = true
    --},
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    })
})
