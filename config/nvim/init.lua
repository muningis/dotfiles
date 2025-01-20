local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set basic options
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Load keymaps
require("config.keymaps")

-- Plugin specifications
require("lazy").setup({
    -- LSP Support
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            require("plugins.lspconfig")
        end
    },


    -- Easily add comments
    {
        "numToStr/Comment.nvim",
        opts = {}, 
        config = function()
          require("Comment").setup()
        end,
    },

    -- Nicer pop-ups
    {
        "stevearc/dressing.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
        config = function()
          require("dressing").setup()
        end,
  }, 


    -- Syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("plugins.treesitter")
        end
    },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({})
        end
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({})
        end
    },

    -- Shortcuts helper
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.which-key")
        end
    },

    -- Breadcrumbs
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            require("plugins.barbecue")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha"
            })

            vim.cmd.colorscheme("catppuccin");
        end
    }   

    -- {
    --     "rebelot/kanagawa.nvim",
    --     name = "kanagawa",
    --     priority = 1000,
    --     config = function()
    --       require("kanagawa").setup({
    --         commentStyle = { italic = true },
    --       })
    --       vim.cmd.colorscheme("kanagawa")
    --       vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --      end,
    -- }, 
})
