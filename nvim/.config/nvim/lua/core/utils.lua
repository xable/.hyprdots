local M = {}

function M.map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { noremap = true, silent = true }, opts or {}))
end

function M.augroup(name, cb)
  local group = vim.api.nvim_create_augroup(name, { clear = true })
  cb(function(event, opts)
    vim.api.nvim_create_autocmd(event, vim.tbl_extend("force", { group = group }, opts or {}))
  end)
end

return M
