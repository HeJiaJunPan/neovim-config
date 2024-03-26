return {
    {
        "folke/tokyonight.nvim",
        -- "navarasu/onedark.nvim",
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        config = function()
            local themeName = "tokyonight"
            vim.cmd[[colorscheme tokyonight-storm]]
            require('lualine').setup({
                options = {
                    theme = themeName
                },
            })

            require('barbecue').setup {
                theme = themeName,
            }
        end
    },
}
