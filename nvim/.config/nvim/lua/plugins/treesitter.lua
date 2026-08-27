-- nvim-treesitter `main` branch: parsers are installed via `install()` and
-- highlighting/indent are enabled per-buffer, not through a `setup()` opts table.
local ensure_installed = {
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
  "markdown_inline",
  "terraform",
  "hcl",
  "zig",
  "rego",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- `main` is the repo's default branch, so it does not need to be named.
    -- No tagged releases exist on `main` -- the v0.* tags are all on the frozen
    -- `master` branch, which does not support Neovim 0.12 -- so pin a commit.
    commit = "8b98b4470eb326f1c7b50dae79f8c963568e5720",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup({})

      local installed = {}
      for _, lang in ipairs(ts.get_installed("parsers")) do
        installed[lang] = true
      end

      local missing = vim.tbl_filter(function(lang)
        return not installed[lang]
      end, ensure_installed)

      if #missing > 0 then
        ts.install(missing)
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang or not vim.treesitter.language.add(lang) then
            return
          end

          pcall(vim.treesitter.start, args.buf, lang)

          -- Only use treesitter indent where an indents query exists.
          if vim.treesitter.query.get(lang, "indents") then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    commit = "898ee307df58f854d11cd7edd06472574d48014e",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter-textobjects").setup({})

      -- In diff mode prefer the built-in ]c / [c hunk motions over the
      -- treesitter class/function motions.
      local move = require("nvim-treesitter-textobjects.move")
      local diff_keys = {
        goto_next_start = "]c",
        goto_next_end = "]c",
        goto_previous_start = "[c",
        goto_previous_end = "[c",
      }

      for name, key in pairs(diff_keys) do
        local fn = move[name]
        if fn then
          move[name] = function(...)
            if vim.wo.diff then
              vim.cmd("normal! " .. key)
              return
            end
            return fn(...)
          end
        end
      end
    end,
  },
}
