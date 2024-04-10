function run()
    local fileExtension = vim.fn.expand('%:e')
    -- 脚本执行命令
    local executor = {
        py = 'python3 %',
        lua = 'lua %',
        js = 'node %',
        sh = 'sh %'
    }
    
    local cmd = executor[fileExtension]
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
