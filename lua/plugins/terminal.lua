function run()
    local fileExtension = vim.fn.expand('%:e')
    local cmd = nil
    if fileExtension == 'py' then
        cmd = 'python3 %'
    elseif fileExtension == 'lua' then
        cmd = 'lua %'
    elseif fileExtension == 'js' then
        cmd = 'node %'
    elseif fileExtension == 'sh' then
        cmd = 'sh %'
    end

    if cmd  then
        return string.format([[<cmd>TermExec cmd="%s"<cr>]], cmd)
    else
        return [[<cmd>echo "No executor defined"<cr>]]
    end
end

return {
    'akinsho/toggleterm.nvim',
    -- event = 'VeryLazy',
    keys = {
        {'<c-t>', '<cmd>ToggleTerm<cr>'},
        {'<F5>', run()}
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
