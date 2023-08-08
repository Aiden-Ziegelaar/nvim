plugins = {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'neovim/nvim-lspconfig'
  },

  {
    'github/copilot.vim',
  },

  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "hcl", "c", "lua", "vim", "vimdoc", "javascript", "html", "typescript", "rust", "python" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  {
    "nvim-tree/nvim-tree.lua"
  },

  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    lazy = "false"
  },
  {
    "ms-jpq/coq_nvim"
  },
  require("plugins/coc")
}
