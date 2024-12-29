vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selection up/down in V mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m <-2<CR>gv=gv")


-- Half screen jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste into place/selection without dropping from register
vim.keymap.set("n", "<leader>p", "\"_dP")

-- Clipbard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- Switch project
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


-- Navigation
vim.keymap.set("i", "<C-b>", "<ESC>^i")
vim.keymap.set("i", "<C-e>", "<End>")

-- Window/Pane switch
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- LSP
vim.keymap.set("n", "<leader>fm", function()
  vim.lsp.buf.format { async = true }
end)

-- Terminal
vim.keymap.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))
vim.keymap.set('n', '<leader>tt', ':belowright split | terminal<CR>')

-- Tree
vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
vim.keymap.set("n", "<leader>e", "<cmd> NvimTreeFocus <CR>")

-- Indention
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

