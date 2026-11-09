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

require("filetypes")

require("commands")

-- setup with Lazy.nvim
require("lazy").setup(
  "plugins",
  {
    ui = {
      border = "rounded",
    },
  }
)

local light_theme_table = {
  catppuccin = "catppuccin-latte",
  github = "github_light",
  tokyo = "tokyonight-day"
}

local dark_theme_table = {
  catppuccin = "catppuccin",
  github = "github_dark",
  tokyo = "tokyonight-night"
}

local system_mode = vim.fn.system("defaults read -g AppleInterfaceStyle")
-- strip whitespace; possible strings are "Dark\n" or "Light\n"
system_mode = system_mode:gsub("%s+", "")
if system_mode == "Dark" then
  -- Apply your dark theme here
  vim.cmd.colorscheme(dark_theme_table.github)
else
  -- Apply your light theme here
  vim.cmd.colorscheme(light_theme_table.github)
end
-- settings
-- vim.cmd.colorscheme("tokyonight-moon")
-- vim.cmd.colorscheme("fluoromachine")
-- vim.cmd.colorscheme("kanagawa")
-- vim.cmd.colorscheme("vague")
-- Goes best with "Oceanic Next"
-- vim.cmd.colorscheme("evergarden")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("gruvbox")
-- vim.cmd.colorscheme("kanagawa-paper-ink")
-- vim.cmd.colorscheme("nightfox")
-- vim.cmd.colorscheme("github_dark")
-- vim.cmd.colorscheme("github_dark_high_contrast")
-- vim.cmd.colorscheme("terafox")
-- vim.cmd.colorscheme("carbonfox")
-- vim.cmd.colorscheme("nasa_wds")
-- vim.cmd.colorscheme("ghostty-default-style-dark")
