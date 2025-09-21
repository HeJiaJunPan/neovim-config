return {
    'mason-org/mason.nvim',
    cmd = {'Mason'},
    event = {'BufReadPost', 'BufNewFile'},
    dependencies = {
        'neovim/nvim-lspconfig',
        'mason-org/mason-lspconfig.nvim'
    },
    config = function()
    -- LSP服务器列表,键表示服务器名称，值表示服务器配置
        local servers = {
            lua_ls = {},
            jsonls = {},
            -- tsserver = {} ,
            html = {},
            cssls = {},
            bashls = {},
            pyright = {}
        }

        -- mason提供LSP安装面板
        require('mason').setup({
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗'
                }
            }
        })

        -- mason安装LSP后，通过mason-lspconfig启动LSP服务器
        require('mason-lspconfig').setup()

        -- 迭代LSP服务器列表，逐个启用LSP服务器
        for server, config in pairs(servers) do
            vim.lsp.enable(server)
        end

    end
}
