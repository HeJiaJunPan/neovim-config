return {
    'williamboman/mason.nvim',
    cmd = {'Mason'},
    event = {'BufReadPost', 'BufNewFile'},
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason-lspconfig.nvim',
        -- 使用JSON设置LSP个性化配置
        'folke/neoconf.nvim'
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
    
        -- 可选，为LSP添加快捷键
        local on_attach = function(_, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end
            
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('gd', require "telescope.builtin".lsp_definitions, '[G]oto [D]efinition')
            nmap('K', "<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation')
            nmap('gi', require "telescope.builtin".lsp_implementations, '[G]oto [I]mplementation')
            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>rn', "<cmd>Lspsaga rename ++project<cr>", '[R]e[n]ame')
            nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')
            nmap('<leader>da', require "telescope.builtin".diagnostics, '[D]i[A]gnostics')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
            nmap("<space>f", function()
                vim.lsp.buf.format({ async = true })
            end, "[F]ormat code")
        end

        -- neoconf必须在lsp-config前调用
        require('neoconf').setup()
        
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
        require('mason-lspconfig').setup({
            ensure_installed = vim.tbl_keys(servers)
        })
        
        -- 暴露LSP给CMP补全使用
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        
        -- 迭代LSP服务器列表，逐个启用LSP服务器
        local lspconfig = require('lspconfig')
        for server, config in pairs(servers) do
            lspconfig[server].setup(
                vim.tbl_deep_extend('keep', {on_attach = on_attach, capabilities = capabilities}, config)
            )
        end
    
    end
}
