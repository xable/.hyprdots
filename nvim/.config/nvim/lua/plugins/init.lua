return {
  -- Navigation
  "andymass/vim-matchup",
  "justinmk/vim-dirvish",
  { "folke/trouble.nvim", config = true },
  { "smoka7/hop.nvim",
    config = function()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
},

  -- Interface
  "nvim-tree/nvim-web-devicons",

  -- LSP config defaults (cmd, filetypes)
  "neovim/nvim-lspconfig",
  }
