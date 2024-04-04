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

-- 如果当前版本不支持内置OSC52，则使用插件添加OSC52功能
vim.opt.clipboard = 'unnamedplus'
local ok, clipboard = pcall(require, 'vim.ui.clipboard.osc52')
if ok then
    vim.g.clipboard = {
        name = 'osc52',
        copy = {['+'] = clipboard.copy('+'), ['*'] = clipboard.copy('*')},
        paste = {['+'] = clipboard.paste('+'), ['*'] = clipboard.paste('*')}
    }

    return {}
else
    vim.g.clipboard = {
        name = 'osc52',
        copy = {['+'] = copy, ['*'] = copy},
        paste = {['+'] = paste, ['*'] = paste},
    }

    return {
        'ojroques/nvim-osc52',
        event = 'VeryLazy',
        config = true
    }
end
