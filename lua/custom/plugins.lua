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
        case_insensitive = false,
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
    lazy = true,
    command = {
      "MarkdownPreview",
      "MarkdownPreviewStop",
      "MarkdownPreviewToggle",
    },
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
    opts = {
      view = {
        default = {
          layout = "diff2_vertical",
        },
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
  },

  {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
      },
    },
    lazy = true,
    cmd = {
      "CMakeBuild",
      "CMakeClean",
      "CMakeConfigure",
      "CMakeInstall",
      "CMakeTest",
      "CMakeToggle",
      "CMakeRun",
      "CMakeOpen",
      "CMakeGenerate",
    },
    config = function()
      require("cmake-tools").setup {
        cmake_command = "cmake", -- this is used to specify cmake command path
        cmake_regenerate_on_save = false, -- auto generate when save CMakeLists.txt
        cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
        cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
        cmake_build_directory = "", -- this is used to specify generate directory for cmake
        cmake_build_directory_prefix = "", -- when cmake_build_directory is set to "", this option will be activated
        cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
        cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
        cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
        cmake_variants_message = {
          short = { show = true }, -- whether to show short message
          long = { show = true, max_length = 40 }, -- whether to show long message
        },
        cmake_dap_configuration = { -- debug settings for cmake
          name = "cpp",
          type = "codelldb",
          request = "launch",
          stopOnEntry = false,
          runInTerminal = true,
          console = "integratedTerminal",
        },
        cmake_executor = { -- executor to use
          name = "quickfix", -- name of the executor
          opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
          default_opts = { -- a list of default and possible values for executors
            quickfix = {
              show = "always", -- "always", "only_on_error"
              position = "botright", -- "bottom", "top"
              size = 10,
            },
            overseer = {
              new_task_opts = {}, -- options to pass into the `overseer.new_task` command
              on_new_task = function(task) end, -- a function that gets overseer.Task when it is created, before calling `task:start`
            },
            terminal = {}, -- terminal executor uses the values in cmake_terminal
          },
        },
        cmake_terminal = {
          name = "terminal",
          opts = {
            name = "Main Terminal",
            prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
            split_direction = "horizontal", -- "horizontal", "vertical"
            split_size = 11,

            -- Window handling
            single_terminal_per_instance = true, -- Single viewport, multiple windows
            single_terminal_per_tab = true, -- Single viewport per tab
            keep_terminal_static_location = true, -- Static location of the viewport if avialable

            -- Running Tasks
            start_insert_in_launch_task = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
            start_insert_in_other_tasks = false, -- If you want to enter terminal with :startinsert upon launching all other cmake tasks in the terminal. Generally set as false
            focus_on_main_terminal = false, -- Focus on cmake terminal when cmake task is launched. Only used if executor is terminal.
            focus_on_launch_terminal = false, -- Focus on cmake launch terminal when executable target in launched.
          },
        },
        cmake_notifications = {
          enabled = true, -- show cmake execution progress in nvim-notify
          spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
          refresh_rate_ms = 100, -- how often to iterate icons
        },
      }
    end,
  },

  { "tpope/vim-surround", lazy = false },

  {
    "karb94/neoscroll.nvim",
    lazy = true,
    event = { "CursorHold", "CursorHoldI" },
    config = require "custom.configs.neoscroll",
  },

  {
    "mbbill/undotree",
    lazy = true,
    cmd = { "UndotreeToggle" },
    config = function()
      vim.g.undotree_WindowLayout = 2
    end,
  },

  -- {
  --   "lervag/vimtex",
  --   ft = {
  --     "tex",
  --   },
  --   config = function()
  --     vim.cmd "call vimtex#init()"
  --     vim.g.vimtex_compiler_method = "latexmk"
  --     vim.g.vimtex_view_general_viewer = "qpdfview"
  --     -- vim.g.tex_flavor = "main"
  --     vim.g.vimtex_compiler_latexmk = {
  --       aux_dir = "./aux",
  --       out_dir = "./out",
  --     }
  --     vim.g.vimtex_indent_enabled = 0
  --     -- vim.g.vimtex_view_general_options = "--noraise --unique file:@pdf\\#src:@line@tex"
  --     vim.g.vimtex_view_general_options = "--unique @pdf\\#src:@tex:@line:@col"
  --   end,
  -- },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = "./aux",
        out_dir = "./out",
      }
      vim.g.vimtex_indent_enabled = 0
      vim.g.vimtex_view_general_viewer = "okular"
      vim.g.vimtex_view_general_options = "--noraise --unique file:@pdf\\#src:@line@tex"
    end,
  },
}

-- ui["karb94/neoscroll.nvim"] = {
-- 	lazy = true,
-- 	event = { "CursorHold", "CursorHoldI" },
-- 	config = require("ui.neoscroll"),
-- }

return plugins
