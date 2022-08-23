--------------------------------------------------------------------------------
-- Plugin manager configuration file
--------------------------------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

--------------------------------------------------------------------------------
-- Configuration
--------------------------------------------------------------------------------
return require('packer').startup(function()
    -- This plugin manager!
    use 'wbthomason/packer.nvim'

    ----------------------------------------------------------------------------
    -- User Interface
    ----------------------------------------------------------------------------

    -- color schemes
    use 'navarasu/onedark.nvim'
    use 'shaunsingh/nord.nvim' -- replaces official for treesitter support
    use 'folke/tokyonight.nvim'

    -- icons
    use 'kyazdani42/nvim-web-devicons'

    -- improved status lines
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = { theme = 'nord' }
            }
        end
    }

    -- git gutter support
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup()
        end
    }


    -- indent lines
    use 'lukas-reineke/indent-blankline.nvim'

    -- same word highlighting
    use 'RRethy/vim-illuminate'

    ----------------------------------------------------------------------------
    -- LSP / Language Support
    ----------------------------------------------------------------------------

    -- treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'm-demare/hlargs.nvim'

    -- mason (LSP manager)
    use {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    }

    use {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup()
        end
    }

    -- language server interface
    use 'neovim/nvim-lspconfig'

    -- autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
        },
    }

    -- rust tools
    use 'simrat39/rust-tools.nvim'

    ----------------------------------------------------------------------------
    -- Utility
    ----------------------------------------------------------------------------

    -- file explorer
    use 'kyazdani42/nvim-tree.lua'

    -- autopairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim'} },
    }

    -- intelligent code commenting
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    }

    -- minimap
    use 'wfxr/minimap.vim'

    -- TODO support
    use {
        'folke/todo-comments.nvim',
        config = function()
            require('todo-comments').setup {
                highlight = {
                    keyword = "bg",
                    max_line_len=2000,
                }
            }
        end
    }

    -- diagnostics window
    use {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {}
        end
    }

    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('diffview').setup {
                enhanced_diff_hl = true
            }
        end
    }

end)
