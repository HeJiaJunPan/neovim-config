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
map('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', 'Buffer 1')
map('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', 'Buffer 2')
map('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', 'Buffer 3')
map('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', 'Buffer 4')
map('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', 'Buffer 5')
map('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', 'Buffer 6')
map('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', 'Buffer 7')
map('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', 'Buffer 8')
map('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', 'Buffer 9')
map('n', '<leader>$', '<Cmd>BufferLineGoToBuffer -1<CR>', 'Buffer last')
