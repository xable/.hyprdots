local augroup = require("core.utils").augroup

augroup("general", function(autocmd)
  autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
      vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
  })

  autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.setpos(".", save_cursor)

      local dir = vim.fn.expand("<afile>:p:h")
      if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
      end
    end,
  })

  autocmd("VimResized", {
    pattern = "*",
    command = "tabdo wincmd =",
  })
end)

augroup("filetypes", function(autocmd)
  autocmd("FileType", {
    pattern = { "qf", "help", "man", "lspinfo", "notify", "checkhealth" },
    callback = function()
      vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true, nowait = true })
    end,
  })

  autocmd("FileType", {
    pattern = { "json", "yaml" },
    callback = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
    end,
  })
end)

augroup("lastplace", function(autocmd)
  autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lc = mark[1]
      if lc > 1 and lc <= vim.api.nvim_buf_line_count(0) then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end,
  })
end)
