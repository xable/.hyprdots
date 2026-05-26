return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    cond = function()
      return vim.fn.executable("cmake") == 1
    end,
    config = function()
      require("telescope").load_extension("fzf")
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
