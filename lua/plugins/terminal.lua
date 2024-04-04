return {
    'akinsho/toggleterm.nvim',
    -- event = 'VeryLazy',
    keys = {
        {'<c-t>', '<cmd>ToggleTerm<cr>'}
    },
    opts = {
        open_mapping = '<c-t>',
        hide_numbers = true,
        autochdir = false,
        direction = 'float',
        close_on_exit = true,
        auto_scroll = true
    }
}
