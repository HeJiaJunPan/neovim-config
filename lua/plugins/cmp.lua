return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        -- 代码片段，LuaSnip补全依赖cmp_luasnip
        -- friendly-snippets是vscode-like格式的第三方代码片段库，为LuaSnip提供代码片段
        {
            'saadparwaiz1/cmp_luasnip',
            dependencies = {
                'L3MON4D3/LuaSnip',
                'rafamadriz/friendly-snippets',
            }
        },
        -- 类vscode外观的补全界面
        'onsails/lspkind.nvim'
    },
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        -- 懒加载第三方代码片段friendly-snippets
        if vim.g.userSnippet == nil then
            require('luasnip.loaders.from_vscode').lazy_load()
        else
            require('luasnip.loaders.from_vscode').lazy_load({
                paths = {
                    vim.fn.stdpath("data") .. '/lazy/friendly-snippets',
                    vim.g.userSnippet
                } 
            })
        end
        
        cmp.setup({
            snippet = {
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users
                end
            },
            completion = { completeopt = 'menu,menuone,noinsert' },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Esc>'] = cmp.mapping.close(),
                ['<Tab>'] = function(fallback)
                	if cmp.visible() then
                		cmp.select_next_item()
                	else
                		fallback()
                	end
                end,
                ['<S-Tab>'] = function(fallback)
                	if cmp.visible() then
                		cmp.select_prev_item()
                	else
                		fallback()
                	end
                end
				
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'luasnip' }
            }),
            formatting = {
            	format = lspkind.cmp_format({
            		mode = "symbol_text",
            		menu = {
            			nvim_lsp = '[LSP]',
            			buffer = '[Buffer]',
            			path = '[Path]',
            			luasnip = '[US]'
            		}
            	})
            }

        })

        cmp.setup.cmdline({'/','?'}, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'cmdline' }
            })
        })
    end
}
