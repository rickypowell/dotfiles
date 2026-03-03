return {
  {
    "rickypowell/gitbutler-nvim",
    build = "cargo build --release",
    dir = "/Users/rickypowell/rust/gitbutler-nvim",
    config = function()
      require("gitbutler").setup({
        -- Optional: point directly to built backend path.
        -- backend = vim.fn.stdpath("data") .. "/lazy/gitbutler-nvim/target/release/gitbutler-nvim",
        backend = "/Users/rickypowell/rust/gitbutler-nvim/target/debug/gitbutler-nvim",
        log_default_count = 20,
      })
    end,
  },

}
