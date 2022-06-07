--------------------------------------------------------------------------------
-- nvim-tree: File manager
--------------------------------------------------------------------------------

-- Plugin: nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua

local g = vim.g

g.nvim_tree_width_allow_resize = 1
-- g.nvim_tree_show_icons = {
--     git = 1,
--     folders = 1,
--     files = 1,
-- }
-- g.nvim_tree_icons = {
--     default = "‣ "
-- }

require('nvim-tree').setup {
    actions = {
        open_file = {
            quit_on_open = false,
            window_picker = {
                enable = false,
            },
        },
    },
    filters = {
        dotfiles = true,
        custom = { '.git', 'node_modules', '.cache', '.bin' },
    },
    git = {
        enable = true,
        ignore = true,
    },
    open_on_setup = false,
    renderer = {
        highlight_git = true,
        highlight_opened_files = 'name',
        icons = {
            glyphs = {
                default = '‣ ',
            },
            show = {
                file = true,
                folder = true,
                git = true,
            },
        },
        indent_markers = {
            enable = true,
        },
    },
    respect_buf_cwd = true,
    update_cwd = true,
    view = {
        width = 32,
        auto_resize = true,
    },
}
