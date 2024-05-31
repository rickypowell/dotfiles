-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = ev.buf })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = ev.buf })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = ev.buf })
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = ev.buf })
    -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder", buffer = ev.buf })
    -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder", buffer = ev.buf })
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = "List workspace folders", buffer = ev.buff })
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { desc = "Type definition", buffer = ev.buf })
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename", buffer = ev.buf })
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = ev.buf })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References", buffer = ev.buf })
    vim.keymap.set("n", "<space>F", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format", buffer = ev.buff })
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end,
})
