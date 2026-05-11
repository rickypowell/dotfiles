return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      local warned_about_missing_executable = false
      local swiftlint_group = vim.api.nvim_create_augroup("swiftlint_diagnostics", { clear = true })

      lint.linters_by_ft = {
        swift = { "swiftlint" },
      }

      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
        group = swiftlint_group,
        pattern = "*.swift",
        callback = function()
          if vim.fn.executable("swiftlint") ~= 1 then
            if not warned_about_missing_executable then
              warned_about_missing_executable = true
              vim.notify("swiftlint executable not found in PATH", vim.log.levels.WARN)
            end
            return
          end

          lint.try_lint("swiftlint")
        end,
      })
    end,
  },
}
