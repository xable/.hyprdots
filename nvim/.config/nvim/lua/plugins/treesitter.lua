return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  config = function()
    local configs = require "nvim-treesitter.configs"

    configs.setup {
      ensure_installed = {
        "bash",
        "css",
        "diff",
        "elixir",
        "gitignore",
        "heex",
        "html",
        "javascript",
        "json",
        "latex",
        "lua",
        "python",
        "markdown",
        "query",
        "regex",
        "scss",
        "sql",
        "toml",
        "yaml",
      }, -- one of "all" or a list of languages
      sync_install = true,
      auto_install = true,
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = "",  -- list of language that will be disabled
        use_languagetree = true,
      },
      autopairs = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
