return {
    {
        -- 会话管理插件
        "folke/persistence.nvim",
        keys = {
            { "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]] },
            { "<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]] },
            { "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]] },
        },
        config = true,
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        opts = {
            enable_check_bracket_line = false,
        },
    },
    {
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {
        "folke/flash.nvim",
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
            {
                -- 模拟easymotain：向上跳转
                "<leader><leader>k",
                mode = {"n"},
                function()
                    require("flash").jump({
                        search = { forward = false, wrap = false, mode = "search", max_length = 0 },
                        label = { after = { 0, 0 } },
                        pattern = "^"
                    })
                end,
                desc = "easymotain up"
            },
            {
                -- 模拟easymotain：向下跳转
                "<leader><leader>j",
                mode = {"n"},
                function()
                    require("flash").jump({
                        search = { forward = true, wrap = false, mode = "search", max_length = 0 },
                        label = { after = { 0, 0 } },
                        pattern = "^"
                    })
                end,
                desc = "easymotain down"
            },
        },
        config = true
    },
    {
        -- 第三方拼写检查工具
        "kamykn/spelunker.vim",
        event = "VeryLazy",
        config = function()
            vim.g.spelunker_check_type = 2
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        -- gcc:行注释
        -- gbc:块注释
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = true
    },
    {
        -- ys[文本对象][环绕文本对象]:为指定的文本对象添加环绕文本对象（',",[,{）
        -- ds[环绕文本对象]:删除环绕文本对象
        -- cs[待替换环绕文本对象][新环绕文本对象]:更换环绕文本对象
        -- dsf:删除函数名，仅保留函数参数
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = true
    },
    {
        -- 替代tsserver LSP，tsserver经常卡死SSH
        "pmizio/typescript-tools.nvim",
        ft = {'javascript', 'typescript'},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig"
        },
        opts = {
            settings = {
                complete_function_calls = true
            }
        }
    }
}
