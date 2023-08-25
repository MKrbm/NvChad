local M = {}

-- local lga_actions = require "telescope-live-grep-args.actions"
-- local actions = require "telescope.actions"

M.telescope = {
  pickers = {
    layout_config = {
      scroll_speed = 2,
    },
  },
  defaults = {
    theme = "dropdown",
    results_title = false,
    sorting_strategy = "ascending",
    layout_strategy = "center",
    layout_config = {
      anchor = "s",
      preview_cutoff = 1, -- preview should always show (unless previewer = false)
      width = function(_, max_columns, _)
        return math.min(max_columns, 80)
      end,
      height = 0.4,
    },
    border = true,
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    mappings = {
      i = {
        ["<C-e>"] = require("telescope.actions").preview_scrolling_down,
        ["<C-y>"] = require("telescope.actions").preview_scrolling_up,
        -- ["<S-o>"] = require("telescope.actions").select_all,
        -- ["<S-t>"] = require("telescope.actions").toggle_all,
        ["<C-d>"] = "delete_buffer",
      },
      n = {
        ["<C-d>"] = "delete_buffer",
      },
    },
  },
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "cspell",
  },
}

local my_on_attach = function(bufnr)
  local api = require "nvim-tree.api"
  local opts = function(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts "Up")
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
  vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "<S-l>", function(node)
    local nt_api = require "nvim-tree.api"
    nt_api.node.open.edit(node)
    nt_api.tree.focus()
    vim.api.nvim_input "2w" -- Simulate 'w' keypress
  end, opts "Help")
end

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  on_attach = my_on_attach,
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.which_key = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in normal or <c-r> in insert mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  key_labels = {},
  popup_mappings = {
    scroll_down = "<c-e>", -- binding to scroll down inside the popup
    scroll_up = "<c-y>", -- binding to scroll up inside the popup
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label

  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

return M
