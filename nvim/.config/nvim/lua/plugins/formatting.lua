return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local fmt_config = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 550,
      }

      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
        },
        format_on_save = fmt_config,
      })

      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format(fmt_config)
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
}
