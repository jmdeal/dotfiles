--------------------------------------------------------------------------------
--                       Harpoon (ThePrimeagen/harpoon)                       --
--------------------------------------------------------------------------------

vim.keymap.set('n', '<leader>hh', require('harpoon.ui').toggle_quick_menu, { desc = '[HH]arpoon!!!'})
vim.keymap.set('n', '<leader>h\'', require('harpoon.mark').add_file, { desc = '[H]arpoon mark [\']'})

