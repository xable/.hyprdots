return {
  -- Navigation
  "andymass/vim-matchup",
  "justinmk/vim-dirvish",
  { "folke/trouble.nvim", config = true },
  { "phaazon/hop.nvim",
    config = function()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
},

  -- Interface
  "nvim-tree/nvim-web-devicons"
  }
