## 依赖要求
git
npm

## 下载配置文件
```bash
git clone https://github.com/HeJiaJunPan/neovim-config.git ~/.config/nvim
```

```
## 配置目录

├── init.lua                     -- neovim配置入口
├── lazy-lock.json
├── lua
│   ├── basic.lua                -- 基本配置
│   ├── keymaps.lua              -- 快捷键映射
│   ├── lazy-init.lua            -- Lazy插件管理器配置
│   ├── plugins
│   │   ├── cmp.lua              -- 代码补全设置
│   │   ├── lsp.lua              -- 语言服务器配置
│   │   ├── osc52.lua            -- 远程剪贴版配置
│   │   ├── telescope.lua        -- telescope插件配置
│   │   ├── terminal.lua         -- 浮动终端配置
│   │   ├── theme.lua            -- 主题配置
│   │   ├── tree.lua             -- 目录树配置
│   │   ├── treesitter.lua.bak   -- treesitter配置，默认不启用
│   │   ├── ui.lua               -- 编辑器UI配置
│   │   └── utils.lua            -- 编辑工具类插件
│   └── snippet                  -- 用户Snippets
│       ├── package.json
│       └── snippets
│           └── python.json
```
