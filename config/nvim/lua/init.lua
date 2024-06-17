require("custom.remap");
require("custom.config");

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require("config.cmp")
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end
  }, {
    "williamboman/mason.nvim",
  },{
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("config.mason")
    end
  }, {
    "neovim/nvim-lspconfig",
    config = function() 
      require("config.lspconfig")
    end
  }, {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("config.nvim-tree")
    end
  }, {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile"},
    build = ":TSUpdate",
    config = function()
      require("config.treesitter")
    end,
  }, {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("config.telescope")
    end,
  },{
    "mfussenegger/nvim-lint",
    config = function()
      require("config.lint")
    end
  },{
    "mfussenegger/nvim-dap",
    config = function()
      require("config.dap")
    end
  }, {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      require("config.dapui")
    end
  }, {
    "nvim-neotest/neotest",
    dependencies= {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
    },
    config = function()
      require("config.neotest")
    end
  }, {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
       vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
     end,
  }
}

require("lazy").setup(plugins)

