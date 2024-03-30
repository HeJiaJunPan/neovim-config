local option = vim.opt
local buffer = vim.b
local global = vim.g

-- Globol Settings --
option.showmode = false
option.backspace = { 'indent', 'eol', 'start' }
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.shiftround = true
option.autoindent = true
option.smartindent = true
option.number = true
option.relativenumber = true
option.wildmenu = true
option.hlsearch = false
option.ignorecase = true
option.smartcase = true
option.completeopt = { 'menuone', 'noselect' }
option.cursorline = true
option.termguicolors = true
option.signcolumn = 'yes'
option.autoread = true
option.title = true
option.swapfile = false
option.backup = false
option.updatetime = 50
option.mouse = 'a'
option.undofile = true
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')
option.exrc = true
option.wrap = false
option.splitright = true
option.hidden = true
option.scrolloff = 5

-- Buffer Settings --
buffer.fileenconding = 'utf-8'

-- Global Settings --
global.mapleader = ' '

-- autocmd Settings --
-- 插入模式使用绝对行号
vim.api.nvim_create_autocmd('InsertEnter', {
    pattern = '*',
    command = 'set norelativenumber number'
})
-- 离开插入模式使用相对行号
vim.api.nvim_create_autocmd('InsertLeave', {
    pattern = '*',
    command = 'set relativenumber'
})
