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

-- settings
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("fluoromachine")
-- vim.cmd.colorscheme("kanagawa")
-- vim.cmd.colorscheme("vague")
-- Goes best with "Oceanic Next"
-- vim.cmd.colorscheme("evergarden")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("gruvbox")
-- vim.cmd.colorscheme("kanagawa-paper-ink")
-- vim.cmd.colorscheme("nightfox")
-- vim.cmd.colorscheme("github_dark_high_contrast")
-- vim.cmd.colorscheme("terafox")
-- vim.cmd.colorscheme("carbonfox")
-- vim.cmd.colorscheme("nasa_wds")
-- vim.cmd.colorscheme("ghostty-default-style-dark")
