local map = function(mode, keys, mappings, desc)
    local opts = {
        noremap = true,
        silent = true,
        desc = desc
    }
    vim.api.nvim_set_keymap(mode, keys, mappings, opts)
end

-- keys Mapping --
map('i', 'jk', '<ESC>', '退出插入模式')
map('n', '<C-j>', '<C-W>j', '向下侧窗口移动焦点')
map('n', '<C-k>', '<C-W>k', '向上侧窗口移动焦点')
map('n', '<C-h>', '<C-W>h', '向左侧窗口移动焦点')
map('n', '<C-l>', '<C-W>l', '向右侧窗口移动焦点')

-- Switch Buffers
-- BufferLine插件切换buffer命令：BufferLineGoToBuffer
-- 原生buffer切换命令: b number
map('n', '<leader>1', '<Cmd>b 1<CR>', 'Buffer 1')
map('n', '<leader>2', '<Cmd>b 2<CR>', 'Buffer 2')
map('n', '<leader>3', '<Cmd>b 3<CR>', 'Buffer 3')
map('n', '<leader>4', '<Cmd>b 4<CR>', 'Buffer 4')
map('n', '<leader>5', '<Cmd>b 5<CR>', 'Buffer 5')
map('n', '<leader>6', '<Cmd>b 6<CR>', 'Buffer 6')
map('n', '<leader>7', '<Cmd>b 7<CR>', 'Buffer 7')
map('n', '<leader>8', '<Cmd>b 8<CR>', 'Buffer 8')
map('n', '<leader>9', '<Cmd>b 9<CR>', 'Buffer 9')
