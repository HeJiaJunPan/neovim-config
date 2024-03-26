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
