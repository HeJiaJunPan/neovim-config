return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        keys = {
            {"<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Open or close the tree", mode = {"n", "v"}}
        },
        config = function()
            require("nvim-tree").setup({
                sort = {sorter = "case_sensitive"},
                view = {width = 30},
                renderer = {group_empty = true},
                filters = {dotfiles = true}
            })
        end
    }
}
