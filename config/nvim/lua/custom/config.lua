vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.shortmess:append "sI"

vim.api.nvim_create_autocmd({"TermOpen", "BufEnter"}, {
  callback = function()
      if vim.bo.buftype == 'terminal' then
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.cmd('resize 10')
      end
  end
})