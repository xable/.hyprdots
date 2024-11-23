-- Bootstrap plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core config
require('core.settings')
require('core.keymaps')

-- Load plugin manager
require("lazy").setup("plugins", {
  change_detection = { notify = false }, -- get a notification when changes are found
  performance = {
    rtp = {
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "netrwSettings",
        -- "netrwFileHandlers",
        -- "netrw_gitignore",
        -- "netrw",
        -- "getscript",
        -- "rrhelper",
        -- "rplugin",
        -- "spellfile",
        -- "logiPat",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  },
})
