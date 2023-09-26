local null_ls = require "null-ls"

local b = null_ls.builtins

local filetypes = {
  "markdown",
}
local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with {
    filetypes = {
      "vue",
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
      "yaml",
      "html",
      "css",
      "scss",
      "sh",
      "markdown",
    },
  },

  -- Lua
  b.formatting.stylua,

  -- latex
  b.formatting.latexindent,
  -- b.diagnostics.vale,

  -- c++
  b.formatting.clang_format,

  -- python
  b.formatting.black.with {
    extra_args = { "--line-length=120" },
  },
  -- cpp
  -- b.formatting.clang_format.with {
  --   filetypes = { "c", "cpp" },
  --   extra_args = require("custom.configs.completion.clang_format"),
  -- },

  --   b.diagnostics.cspell.with {
  --     extra_args = {
  --       "-c",
  --       vim.fn.expand "~/.config/NvChad/cspell/cspell.json",
  --     },
  --     filetypes = filetypes,
  --     -- method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
  --   },
  --   b.code_actions.cspell.with {
  --     config = {
  --       find_json = function(_)
  --         return vim.fn.expand "~/.config/NvChad/cspell/cspell.json"
  --       end,
  --     },
  --     filetypes = filetypes,
  --     method = null_ls.methods.CODE_ACTION,
  --   },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
