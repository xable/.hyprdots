return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})

      local wk = require("which-key")

      -- Hop
      wk.add({
        { "<leader>h", group = "Hop" },
        { "<leader>hw", "<cmd>HopWord<CR>", desc = "Hop to word" },
        { "<leader>hl", "<cmd>HopLine<CR>", desc = "Hop to line" },
        { "<leader>hc", "<cmd>HopChar1<CR>", desc = "Hop to char" },
        { "<leader>h2", "<cmd>HopChar2<CR>", desc = "Hop to 2 chars" },
        { "<leader>hp", "<cmd>HopPattern<CR>", desc = "Hop to pattern" },
      })

      -- LSP
      wk.add({
        { "<leader>l", group = "LSP" },
        { "<leader>la", vim.lsp.buf.code_action, desc = "Code action" },
        { "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
        { "<leader>lf", vim.lsp.buf.format, desc = "Format" },
        { "<leader>ll", vim.diagnostic.open_float, desc = "Line diagnostics" },
        { "<leader>ld", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
        { "<leader>lD", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics" },
        { "<leader>ls", "<cmd>Trouble symbols toggle<CR>", desc = "Symbols" },
        { "[d", vim.diagnostic.goto_prev, desc = "Prev diagnostic" },
        { "]d", vim.diagnostic.goto_next, desc = "Next diagnostic" },
      })

      -- Mason
      wk.add({
        { "<leader>m", group = "Mason" },
        { "<leader>mm", "<cmd>Mason<CR>", desc = "Open Mason" },
        { "<leader>ml", "<cmd>MasonLog<CR>", desc = "Mason log" },
        { "<leader>mu", "<cmd>MasonUpdate<CR>", desc = "Update Mason" },
      })
    end,
  },
}
