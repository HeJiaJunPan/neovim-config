local themeName = 'onedark'
local themeUrls = {
    tokyonight = 'folke/tokyonight.nvim',
    onedark = 'navarasu/onedark.nvim'
}
local themeConfigs = {
    onedark = {
        style = 'dark',
        term_colors = true,
        transparent = true
    },
    tokyonight = {
        style = 'storm',
        terminal_colors = true,
        transparent = true,
        styles = {
            sidebars = 'transparent',
            floats = 'transparent'
        }
    }
}

return {
    themeUrls[themeName],
    dependencies = {
        -- 状态栏
        'nvim-lualine/lualine.nvim',
        'nvim-tree/nvim-web-devicons',
        -- 类似vscode的文档面包屑导航
        'utilyre/barbecue.nvim',
        'SmiteshP/nvim-navic',
    },
    config = function()
        require(themeName).setup(
            themeConfigs[themeName]
        )

        vim.cmd('colorscheme ' .. themeName)

        require('lualine').setup({
            options = {
                theme = themeName
            },
        })

        require('barbecue').setup {
            theme = themeName,
        }
    end
}
