local opts = { noremap = true, silent = true }

-- LSP keybindings
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- LSP actions
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Show documentation" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = "Format code" })
vim.keymap.set('n', '<leader>s', vim.lsp.buf.document_symbol, { desc = "Show symbol information" })
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, { desc = "Show symbol details" })
vim.keymap.set('n', '<leader>i', function()
  vim.lsp.buf.hover()  -- Basic hover info
  vim.lsp.buf.signature_help()  -- Function signature details
end, { desc = "Show detailed symbol info" })

-- File navigation
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set('n', '<C-p>', '<cmd>Telescope git_files<CR>', { desc = "Git Files" })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = "Find in files" })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = "Active buffers" })

-- File explorer
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = "Toggle Filetree" })

-- Insert mode movement and clipboard
vim.keymap.set('i', '<C-h>', '<C-Left>', { desc = "Move left" })
vim.keymap.set('i', '<C-l>', '<C-Right>', { desc = "Move right" })
vim.keymap.set('i', '<M-h>', '<Home>', { desc = "Move to line start" })
vim.keymap.set('i', '<M-l>', '<End>', { desc = "Move to line end" })
vim.keymap.set('i', '<C-v>', '<C-r>+', { desc = "Paste from clipboard" })

-- Insert mode text deletion
vim.keymap.set('i', '<C-k>', '<C-o>D', { desc = "Delete to end of line" })
vim.keymap.set('i', '<C-d>', '<C-o>dw', { desc = "Delete next word" })

-- Indentation
-- vim.keymap.set('i', '<C-[>', '<C-d>', { desc = "Indent line left" })
-- vim.keymap.set('i', '<Tab>', '<C-t>', { desc = "Indent line right" })
vim.keymap.set('v', '<', '<gv', { desc = "Indent selection left" })
vim.keymap.set('v', '>', '>gv', { desc = "Indent selection right" })


-- Swap lines
vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi")

vim.keymap.set('n', '<Esc>', function()
  -- Close LSP floating windows
  vim.lsp.buf.clear_references()
  vim.lsp.buf.clear_references()  -- Repeat to ensure
  
  -- Close all floating windows
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == 'win' or 
       vim.api.nvim_win_get_config(win).relative == 'editor' then
      pcall(vim.api.nvim_win_close, win, false)
    end
  end
  
  -- Clear search highlighting
  vim.cmd('nohlsearch')
end, { desc = "Close popups and clear highlights" })

return {}
