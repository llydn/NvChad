return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require("configs.conform"),
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
    },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "black",
                "pyright",
                "mypy",
                "ruff",
                "luacheck",
                "lua-language-server",
                "pylint",
                "stylua",
            }
        }
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        opts = require("configs.treesitter"),
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
        end,
    },

    -- {
    --     "neoclide/coc.nvim",
    --     event = "VimEnter",
    --     branch = "release",
    -- },

    {
        "ojroques/nvim-osc52",
        config = function()
            require("osc52").setup({
                max_length = 0,           -- Maximum length of selection (0 for no limit)
                silent = false,           -- Disable message on successful copy
                trim = false,             -- Trim surrounding whitespaces before copy
                tmux_passthrough = false, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
            })
        end,
    },

    {
        "github/copilot.vim",
        event = "VimEnter",
    },

    -- {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     event = "BufReadPre",
    --     opts= function ()
    --         return require('configs.null-ls')
    --     end
    -- },

    {
        "nvimtools/none-ls.nvim",
        config = function()
            require('configs.none-ls')
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("configs.nvim-tree")  -- this will load your custom on_attach setup
        end,
    }

}
