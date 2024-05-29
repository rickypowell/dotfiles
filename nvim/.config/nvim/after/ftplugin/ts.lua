vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2


-- Add the $CWD as a workspace folder to get
-- the vim.lsp.buf.references() amoung all of the repo
vim.lsp.buf.add_workspace_folder(vim.fn.getcwd())
