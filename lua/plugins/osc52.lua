-- 配置剪贴板选项
vim.opt.clipboard:append('unnamedplus')

-- SSH环境检测，非SSH环境不加载OSC52功能
if not os.getenv('SSH_TTY') then
    return {}
end

-- 自定义粘贴函数
local paste = function()
    return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end

-- neovim内置OSC52检测
local ok, clipboard = pcall(require, 'vim.ui.clipboard.osc52')
if ok then
    vim.g.clipboard = {
        name = 'osc52',
        copy = {['+'] = clipboard.copy('+'), ['*'] = clipboard.copy('*')},
        paste = {['+'] = paste, ['*'] = paste}
    }

    -- 内置OSC52，不加载第三方插件
    return {}

-- 当前版本不支持内置OSC52，添加第三方OSC52插件
else
    return {
        'ojroques/nvim-osc52',
        -- 新建文件或读取已存在的文件时加载插件
        -- 从面板新建缓冲区时不会加载此插件
        event = {'BufReadPost', 'BufNewFile'},
        config = function()
            -- 自定义provider-clipboard
            local copy = function(osc52)
                return function(lines, _)
                    osc52.copy(table.concat(lines, '\n'))
                end
            end
            
            local osc52 = require('osc52')
            osc52.setup({trim = true})
            vim.g.clipboard = {
                name = 'osc52',
                copy = {['+'] = copy(osc52), ['*'] = copy(osc52)},
                paste = {['+'] = paste, ['*'] = paste},
            }
        end
    }
end
