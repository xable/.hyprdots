local M = {}
local cmd = vim.cmd

function M.create_augroup(autocmds, name)
  cmd('augroup ' .. name)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- resize neovim split when terminal is resized
vim.api.nvim_command('autocmd VimResized * wincmd =')

return M
