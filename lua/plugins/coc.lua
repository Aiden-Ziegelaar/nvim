local M = {
  'neoclide/coc.nvim',
  branch = 'release',
  lazy = false,
}

M.config = function()
  -- Some servers have issues with backup files, see #649
 vim.opt.backup = false
 vim.opt.writebackup = false
 
 -- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
 -- delays and poor user experience
 vim.opt.updatetime = 300
 
 -- Always show the signcolumn, otherwise it would shift the text each time
 -- diagnostics appeared/became resolved
 vim.opt.signcolumn = "yes"
 
 local keyset = vim.keymap.set
 -- Autocomplete
 function _G.check_back_space()
     local col = vim.fn.col('.') - 1
     return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
 end

  -- GoTo code navigation
  keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
  keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
  keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
  keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

  -- Add `:Format` command to format current buffer
  vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

  -- " Add `:Fold` command to fold current buffer
  vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

  -- Add `:OR` command for organize imports of the current buffer
  vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

  -- Add (Neo)Vim's native statusline support
  -- NOTE: Please see `:h coc-status` for integrations with external plugins that
  -- provide custom statusline: lightline.vim, vim-airline
  vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")
  
  local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
  -- Use tab for trigger completion with characters ahead and navigate.
  keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
end

return M
