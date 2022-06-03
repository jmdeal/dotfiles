--------------------------------------------------------------------------------
-- Plugin manager configuration file
--------------------------------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

--------------------------------------------------------------------------------
-- Configuration
--------------------------------------------------------------------------------
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- color schemes
    use 'navarasu/onedark.nvim'
    use 'shaunsingh/nord.nvim' -- replaces official for treesitter support

    -- file explorer
    use 'kyazdani42/nvim-tree.lua'

    -- autopairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    -- icons
    use 'kyazdani42/nvim-web-devicons'

    -- treesitter
    use 'nvim-treesitter/nvim-treesitter'

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

    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = { theme = 'nord' }
            }
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup()
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

end)
