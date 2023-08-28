local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     -- format & linting
  --     {
  --       "jose-elias-alvarez/null-ls.nvim",
  --       config = function()
  --         require "custom.configs.null-ls"
  --       end,
  --     },
  --   },
  --   config = function()
  --     require "plugins.configs.lspconfig"
  --     require "custom.configs.lspconfig"
  --   end, -- Override to setup mason-lspconfig
  -- },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  {
    "folke/which-key.nvim",
    opts = overrides.which_key,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  -- {
  --   "olimorris/persisted.nvim",
  --   lazy = true,
  --   cmd = {
  --     "SessionToggle",
  --     "SessionStart",
  --     "SessionStop",
  --     "SessionSave",
  --     "SessionLoad",
  --     "SessionLoadLast",
  --     "SessionLoadFromFile",
  --     "SessionDelete",
  --   },
  --   config = require "custom.configs.persisted",
  --   after = {
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },

  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   lazy = false,
  --   config = require "custom.configs.ts-context",
  --   after = {
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },

  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   lazy = false,
  --   config = require "custom.configs.ts-textobjects",
  --   after = {
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },

  {
    "nvimdev/lspsaga.nvim",
    lazy = true,
    event = "LspAttach",
    config = require "custom.configs.lspsaga",
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  {
    "chentoast/marks.nvim",
    lazy = false,
    config = function()
      require("marks").setup {
        mappings = {
          set_next = "m,",
          next = "m]",
          preview = "m:",
          set_bookmark0 = "m0",
          prev = false, -- pass false to disable only this default mapping
        },
      }
    end,
  },

  {
    "phaazon/hop.nvim",
    lazy = false,
    config = function()
      require("hop").setup {
        case_insensitive = true,
        char2_fallback_key = "<CR>",
        quit_key = "<Esc>",
      }
    end,
  },

  {
    "dnlhc/glance.nvim",
    lazy = false,
    config = function()
      local glance = require "glance"
      local actions = glance.actions
      glance.setup {
        height = 20,
        zindex = 50,
        preview_win_opts = {
          cursorline = true,
          number = true,
          wrap = true,
        },
        border = {
          enable = true,
          top_char = "―",
          bottom_char = "―",
        },
        list = {
          position = "right",
          width = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
        },
        theme = {
          mode = "brighten",
        },
        folds = {
          folded = true, -- Automatically fold list on startup
        },
        indent_lines = { enable = true },
        winbar = { enable = true },
        mappings = {
          list = {
            ["k"] = actions.previous,
            ["j"] = actions.next,
            ["<Up>"] = actions.previous,
            ["<Down>"] = actions.next,
            ["<S-Tab>"] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
            ["<Tab>"] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
            ["<C-u>"] = actions.preview_scroll_win(8),
            ["<C-d>"] = actions.preview_scroll_win(-8),
            ["<CR>"] = actions.jump,
            ["v"] = actions.jump_vsplit,
            ["s"] = actions.jump_split,
            ["t"] = actions.jump_tab,
            ["c"] = actions.close_fold,
            ["o"] = actions.open_fold,
            ["[]"] = actions.enter_win "preview", -- Focus preview window
            ["q"] = actions.close,
            ["Q"] = actions.close,
            ["<Esc>"] = actions.close,
            ["gq"] = actions.quickfix,
          },
          preview = {
            ["Q"] = actions.close,
            ["<C-c>q"] = actions.close,
            ["<C-c>o"] = actions.jump,
            ["<C-c>v"] = actions.jump_vsplit,
            ["<C-c>s"] = actions.jump_split,
            ["<C-c>t"] = actions.jump_tab,
            ["<C-p>"] = actions.previous_location,
            ["<C-n>"] = actions.next_location,
            ["[]"] = actions.enter_win "list", -- Focus list window
          },
        },
        hooks = {
          before_open = function(results, open, _, method)
            if #results == 0 then
              vim.notify(
                "This method is not supported by any of the servers registered for the current buffer",
                vim.log.levels.WARN,
                { title = "Glance" }
              )
            elseif #results == 1 and method == "references" then
              vim.notify("The identifier under cursor is the only one found", vim.log.levels.INFO, { title = "Glance" })
            else
              open(results)
            end
          end,
        },
      }
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    lazy = false,
    build = ":call mkdp#util#install()",
    -- build = "cd app && npm install && git reset --hard",
  },

  -- {
  --   "harrisoncramer/jump-tag",
  --   lazy = true,
  --   wants = {
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   -- build = "cd app && npm install && git reset --hard",
  -- },

  -- {
  --   "nvim-telescope/telescope-fzf-native.nvim",
  --   build = "make",
  --   wants = {
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   -- build = "cd app && npm install && git reset --hard",
  -- },

  {
    "rhysd/clever-f.vim",
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    config = require "custom.configs.cleverf",
  },

  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    cmd = "Copilot",
    event = "InsertEnter",
    config = require "custom.configs.copilot",
  },

  -- {
  --   "mfussenegger/nvim-treehopper",
  --   lazy = false,
  --   wants = {
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },

  {
    "RRethy/vim-illuminate",
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require("illuminate").configure {
        providers = {
          -- "lsp",
          -- "treesitter",
          "regex",
        },
        filetypes_denylist = {
          "DoomInfo",
          "DressingSelect",
          "NvimTree",
          "Outline",
          "TelescopePrompt",
          "Trouble",
          "alpha",
          "dashboard",
          "dirvish",
          "fugitive",
          "help",
          "lsgsagaoutline",
          "neogitstatus",
          "norg",
          "toggleterm",
        },
        min_count_to_highlight = 2,
      }
    end,
  },

  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = { "DiffviewOpen", "DiffviewClose" },
  },

  {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
      },
    },
    lazy = false,
  },

  { "tpope/vim-surround", lazy = false },
}

-- ui["karb94/neoscroll.nvim"] = {
-- 	lazy = true,
-- 	event = { "CursorHold", "CursorHoldI" },
-- 	config = require("ui.neoscroll"),
-- }

return plugins
