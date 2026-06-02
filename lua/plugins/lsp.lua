return {
    'mason-org/mason-lspconfig.nvim',
    cmd = {'Mason'},
    event = {'BufReadPost', 'BufNewFile'},
    opts = {
        -- LSP默认安装服务器列表
        ensure_installed = {'lua_ls', 'jsonls', 'bashls', 'pyright', 'docker_language_server'}
    },
    dependencies = {
        'neovim/nvim-lspconfig',
        'mason-org/mason.nvim'
    },
    config = function()
    
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
    end
}
