return {
  "smoka7/hop.nvim",
  version = "*",
  enabled = true,
  config = function()
    local hop = require("hop")
    hop.setup({
      keys = "asdghklqwertyuiopzxcvbnmfj",
      keys_length = 2,
    })

    vim.keymap.set("n", "gw", "<cmd>HopWordMW<cr>", { desc = "goto word" })
  end,
}
