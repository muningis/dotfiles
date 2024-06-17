local treesitter = require("nvim-treesitter")

treesitter.setup({
  ensure_installed = { "lua", "javascript", "typescript" },
  auto_install = true,

  highlight = {
    enabled = true,
    use_languagetree = true,    
    additional_vim_regex_highlighting = false,
  },
})

