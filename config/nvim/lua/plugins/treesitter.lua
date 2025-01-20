require("nvim-treesitter.configs").setup({
    ensure_installed = { "zig", "lua", "typescript" },
    highlight = { enable = true },
    indent = { enable = true },
})
 
