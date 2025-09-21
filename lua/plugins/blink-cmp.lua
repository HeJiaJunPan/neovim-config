return {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    -- snippet源默认使用friendly-snippets以及从~/.config/nvim/snippets/加载
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            -- entry键选中补全项
            preset = 'enter',

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ["<Tab>"] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' }

        },

        appearance = {
            nerd_font_variant = 'mono'
        },

        completion = { documentation = { auto_show = false } },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        -- fuzzy实现方法，rust或lua实现，此键值表示rust不可用时使用lua实现
        fuzzy = { implementation = "prefer_rust_with_warning" },
        
        -- 显示函数签名
        signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
}
