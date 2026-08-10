return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- event = "VeryLazy",
    event = { "BufReadPost", "BufNewFile" },
    -- 'opts' automatically calls require('nvim-treesitter.configs').setup(opts)
    opts = {
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "rust",
        "typescript",
        "tsx",
        "javascript",
        "html",
        "swift",
        "markdown",
        "mdx",
        "terraform",
        "hcl",
        "zig",
        "rego",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.config").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      -- We do NOT call configs.setup() here. 
      -- The main plugin handles that via the 'opts' above.
      
      local move = require("nvim-treesitter-textobjects.move")
      local configs = require("nvim-treesitter.config")
      
      -- This loop handles the special 'diff' mode behavior you wanted
      for name, fn in pairs(move) do
        if name:find("goto") == 1 then
          move[name] = function(q, ...)
            if vim.wo.diff then
              -- We access the configuration from the already-initialized module
              local config = configs.get_module("textobjects.move")[name]
              for key, query in pairs(config or {}) do
                if q == query and key:find("[%]%[][cC]") then
                  vim.cmd("normal! " .. key)
                  return
                end
              end
            end
            return fn(q, ...)
          end
        end
      end
    end,
  },
}
-- return {
--   {
--     "nvim-treesitter/nvim-treesitter",
--
--     build = ":TSUpdate",
--
--     event = "VeryLazy",
--
--     opts = {
--       ensure_installed = {
--         "c",
--         "lua",
--         "vim",
--         "vimdoc",
--         "query",
--         "rust",
--         "typescript",
--         "tsx",
--         "javascript",
--         "html",
--         "swift",
--         "markdown",
--         "mdx",
--         "terraform",
--         "hcl",
--         "zig",
--         "rego",
--       },
--       -- sync_install = false,
--       highlight = { enable = true },
--       indent = { enable = true },
--     },
--   },
--   {
--     "nvim-treesitter/nvim-treesitter-textobjects",
--
--     event = "VeryLazy",
--
--     dependencies = {
--       "nvim-treesitter/nvim-treesitter",
--     },
--
--     config = function()
--       local move = require("nvim-treesitter-textobjects.move")
--       local configs = require("nvim-treesitter.configs")
--       configs.setup({
--         ensure_installed = {
--           "c",
--           "lua",
--           "vim",
--           "vimdoc",
--           "query",
--           "rust",
--           "typescript",
--           "tsx",
--           "javascript",
--           "html",
--           "swift",
--           "markdown",
--           "markdown_inline",
--           "zig",
--           "rego",
--         },
--         auto_install = true,
--         sync_install = false,
--         fold = { enable = true },
--         highlight = { enable = true },
--       })
--       -- When in diff mode, we want to use the default
--       -- vim text objects c & C instead of the treesitter ones.
--       -- local move =  ---@type table<string,fun(...)>
--       for name, fn in pairs(move) do
--         if name:find("goto") == 1 then
--           move[name] = function(q, ...)
--             if vim.wo.diff then
--               local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
--               for key, query in pairs(config or {}) do
--                 if q == query and key:find("[%]%[][cC]") then
--                   vim.cmd("normal! " .. key)
--                   return
--                 end
--               end
--             end
--             return fn(q, ...)
--           end
--         end
--       end
--     end,
--   },
-- }
