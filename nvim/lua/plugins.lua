-- Bootstrap lazy.nvim on new machines
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'tpope/vim-fugitive',

    -- TODO: Themes
    'shaunsingh/nord.nvim',
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        config = function()
            vim.opt.background = "dark"
            vim.cmd.colorscheme 'gruvbox'
        end,
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            -- Some useful LSP status updates
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {}},

            'folke/neodev.nvim',
        },
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
        },
    },

    -- Git gutter stuffs
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See :help gitsigns.txt
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            -- TODO: move keybinds to keybind file
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
                vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
                vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
            end,
        },
    },

    { 'nvim-lualine/lualine.nvim', opts = { theme = 'gruvbox' } },

    -- Indentation guides
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
        },
    },

    { 'numToStr/Comment.nvim', opts = {} },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    -- Treesitter: Better text highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    -- TODO Highlighting
    {
        'folke/todo-comments.nvim',
        opts = {
            highlight = {
                keyword = "bg",
                max_line_len = 2000,
            },
        },
    },

    -- Diagnostics Window
    'folke/trouble.nvim',

    -- Autopairs for brackets and braces
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
    },

    'kyazdani42/nvim-web-devicons',

    {
        'ThePrimeagen/harpoon',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
    },
}, {})

