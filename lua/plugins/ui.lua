return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        config = function()
            require("ibl").setup()
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.buttons.val = {
                dashboard.button("e", "  New file", "<cmd>ene <CR>"),
                dashboard.button("f", "󰈞  Find file", "<cmd>lua require('telescope.builtin').find_files()<cr>"),
                dashboard.button("r", "󰊄  Recent files", "<cmd>lua require('telescope.builtin').oldfiles()<cr>"),
                dashboard.button("g", "󰈬  Find text", "<cmd>lua require('telescope.builtin').live_grep()<cr>"),
                dashboard.button("s", "  Restore Session", "<cmd>lua require('persistence').load()<cr>"),
                dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
            }
            require("alpha").setup(dashboard.config)
        end
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require('illuminate').configure()
        end
    }
}
