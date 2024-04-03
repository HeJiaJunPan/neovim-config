-- 自定义provider-clipboard
local function copy(lines, _)
    local osc52 = require('osc52')
    osc52.setup({
        trim = true
    })
    osc52.copy(table.concat(lines, '\n'))
end

local function paste()
    return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end

vim.opt.clipboard = 'unnamedplus'
-- 用provider-clipboard配置剪贴板
vim.g.clipboard = {
    name = 'osc52',
    copy = {['+'] = copy, ['*'] = copy},
    paste = {['+'] = paste, ['*'] = paste},
}

-- 利用包管理器下载插件并加载
-- neovim 10.原生支持osc52，0.95暂时不支持osc52，需要使用插件
return {
    'ojroques/nvim-osc52',
    event = 'VeryLazy',
    config = true
}
