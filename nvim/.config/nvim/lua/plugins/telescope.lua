return {
  'nvim-telescope/telescope.nvim',

  tag = '0.1.5',

  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    if not vim.fn.system({ "which", "rg" }) then
      vim.fn.system({
        "brew",
        "install",
        "ripgrep",
      })
    end

    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        layout_config = {
          prompt_position = "top",
        },

        cache_picker = {
          num_pickers = 10,
          limit_entries = 10,
        },

        sorting_strategy = "ascending",

        file_ignore_patterns = {
          -- "^node_modules/",
          -- "^target/",
        }
      },
    })

    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
    vim.keymap.set("n", "<leader>p", "<cmd>Telescope oldfiles prompt_title=Recent<cr>", { desc = "Find recent files" })
    vim.keymap.set("n", "<leader>fl", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help tags" })
    vim.keymap.set("n", "<leader>fp", "<cmd>Telescope pickers<cr>", { desc = "Find pickers from cache" })
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Find git files" })
  end
}
