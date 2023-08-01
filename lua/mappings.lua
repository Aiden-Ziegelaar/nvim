local builtin = require('telescope.builtin')
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.api.nvim_set_keymap("n", '<leader>ft', ":NvimTreeToggle<cr>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", ";", ":", {})
