-- initialize nvim with lua code
--
-- :author: Ricky Powell
--

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

require("options")

require("keymaps")

require("autocmd")

-- setup with Lazy.nvim
require("lazy").setup(
  "plugins",
  {
    ui = {
      border = "rounded",
    },
  }
)

-- settings
vim.cmd.colorscheme("catppuccin")

