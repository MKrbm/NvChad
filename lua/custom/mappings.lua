---@type MappingsTable
local opts = { noremap = true }
local opts2 = { noremap = true, silent = true, nowait = true }

local M = {}

M.disabled = {
  i = {
    -- ["<C-j>"] = "",
    -- ["<C-k>"] = "",
    -- ["<C-c>"] = "",
  },
  n = {
    ["<tab>"] = "",
    ["<S-tab>"] = "",
    ["<leader>cm"] = "",
  },
  v = {},
}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>ss"] = { "<cmd> SessionSave <CR>", "session save", opts = { noremap = true, nowait = true } },
    ["<leader>sl"] = { "<cmd> SessionLoad <CR>", "session load", opts = { noremap = true, nowait = true } },
    ["zj"] = { "o<C-u><Esc>k", "Insert empty-line below", opts = opts },
    ["zk"] = { "o<C-u><Esc>j", "Insert empty-line above", opts = opts },
    ["<M-j>"] = { "i<CR><Esc>k$", "Insert empty-line at the cursor", opts = opts },
    ["#"] = { "^", "go beginning of the line", opts = opts },
    ["^"] = { "#", "buffer previous", opts = opts },
    ["d#"] = { "d^", "", opts = opts },
    -- ["gp"] = { "`[v`]", "select paste text", opts = opts },
    -- ["fl"] = { "f", "cursor to the next occurence of following character", opts = opts },
    -- ["fh"] = { "<S-f>", "cursor to the next occurence of previous character", opts = opts },
    -- ["tl"] = { "t", "cursor till after the next occurence of following character", opts = opts },
    -- ["th"] = { "<S-t>", "cursor till after the next occurence of previous character", opts = opts },
    ["<leader>["] = { "gg", "begin of file", opts = { noremap = true, nowait = true } },
    ["<leader>]"] = { "G", "end of file", opts = { noremap = true, nowait = true } },
    -- ["[{"] = { "[m", "next {", opts = { noremap = true, nowait = true } },
    -- ["[}"] = { "[]", "prev }", opts = { noremap = true, nowait = true } },
    -- ["]}"] = { "][", "prev }", opts = { noremap = true, nowait = true } },
    -- ["]{"] = { "]m", "next {", opts = { noremap = true, nowait = true } },
    -- ["gcc"] = {"", ""},
    ["<S-M-q>"] = {
      "<CMD>q<CR>",
      "Close buffer",
    },
    ["<M-q>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader>h"] = {
      "<CMD>sp<CR>",
      "split horizontal",
    },
    ["<leader>v"] = {
      "<CMD>vs<CR>",
      "split horizontal",
    },
    ["<C-Up>"] = { ":resize +2<CR>", "Height up" },
    ["<C-Down>"] = { ":resize -2<CR>", "Height down" },
    ["<C-Rigth>"] = { ":vertical resize +2<CR>", "Width up" },
    ["<C-Left>"] = { ":vertical resize -2<CR>", "Width down" },
    -- ["<C-c>"] = { "", "delete ctrl-c", opts = { remap = true } },
    ["<A-h>"] = { "<CMD>tabprevious<CR>", "<CMD>tabprevious<CR>", ots = { remap = true } },
    ["<A-l>"] = { "<CMD>tabnext<CR>", "<CMD>tabnext<CR>", opts = { remap = true } },
    ["tn"] = { "<CMD>tab split<CR>", "<CMD>tabnext<CR>", opts = { remap = true } },
    ["<leader>su"] = {
      '<Cmd>lua require("which-key").show("z=", {mode = "n", auto = true})<CR>',
      "Spell Suggestion",
      opts = { noremap = true, nowait = true },
    },
    ["<leader>sg"] = { "zg", "Spell add" },
    ["<leader>sr"] = { "zug", "Spell remove" },
    [";"] = { "<Plug>(clever-f-repeat-forward)", "clever f" },
    [","] = { "<Plug>(clever-f-repeat-back)", "clever f" },
    ["<leader>xa"] = { ":wa<CR>:qa<CR>", "save all then quit all" },
    ["<leader>n"] = { "<Plug>(clever-f-reset)", "clever f reset" },
  },
  v = {
    ["#"] = { "^", "go beginning of the line", opts = { silent = true } },
    ["^"] = { "#", "search backward for the identifier under the cursor", opts = { silent = true } },
    ["<space>["] = { "[[", "begin of file", opts = { noremap = true, nowait = true } },
    ["<space>]"] = { "]]", "end of file", opts = { noremap = true, nowait = true } },
    ["[{"] = { "[m", "next {", opts = { noremap = true, nowait = true } },
    ["]}"] = { "]m", "prev }", opts = { noremap = true, nowait = true } },
    [";"] = { "<Plug>(clever-f-repeat-forward)", "clever f" },
    [","] = { "<Plug>(clever-f-repeat-back)", "clever f" },
  },
  t = {
    ["<C-h>"] = { "<C-x><C-w>h", "Window left", opts = { remap = true } },
    ["<C-l>"] = { "<C-x><C-w>l", "Window right", opts = { remap = true } },
    ["<C-j>"] = { "<C-x><C-w>j", "Window down", opts = { remap = true } },
    ["<C-k>"] = { "<C-x><C-w>k", "Window up", opts = { remap = true } },
    -- ["<C-c>"] = { "<C-x>", "terminal exit", opts = { remap = true } },
  },
  i = {
    -- ["<C-c>"] = { "", "delete ctrl-c", opts = { remap = true } },
    ["<A-]>"] = { "<C-t>", "next {", opts = { noremap = true, nowait = true } },
    ["<A-[>"] = { "<C-d>", "next {", opts = { noremap = true, nowait = true } },
  },
  c = {
    -- ["<C-c>"] = { "", "delete ctrl-c", opts = { remap = true } },
  },
}

-- more keybinds!

M.telescope = {
  plugin = true,
  n = {
    -- find
    ["<leader>fl"] = { "<cmd> Telescope resume  <CR>", "Resume last search" },

    ["<leader>sf"] = {
      "<cmd> Telescope persisted<CR>",
      "open session folder",
      opts = { noremap = true, nowait = true },
    },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}

M.hop = {
  n = {
    ["G"] = { "<cmd> HopChar2MW <CR>", "nvim-hop char2", opts = { silent = true, noremap = true } },
    -- ["\\"] = { "<cmd> HopChar2MW <CR>", "nvim-hop char2", opts = { silent = true, noremap = true } },
    ["gk"] = { "<cmd> HopLineMW <CR>", "nvim-hop jump to line", opts = { silent = true, noremap = true } },
    ["gw"] = { "<cmd> HopWordMW <CR>", "nvim-hop jump to word", opts = { silent = true, noremap = true } },
    ["gs"] = { "<cmd> HopChar1MW <CR>", "nvim-hop char1", opts = { silent = true, noremap = true } },
  },
}

M.glance = {
  n = {
    -- cycle through buffers
    ["gd"] = { "<CMD>Glance definitions<CR>", "Go definition", opts },
    ["gh"] = { "<CMD>Glance references<CR>", "Go reference", opts },
    ["gy"] = { "<CMD>Glance type_definitions<CR>", "Go type_definitions", opts },
    ["gi"] = { "<CMD>Glance implementations<CR>", "Go implementations", opts },
  },
}

M.Lspsaga = {
  n = {
    ["gr"] = { "<CMD>Lspsaga rename<CR>", "Go definition", opts },
    ["gR"] = { "<CMD>Lspsaga rename ++project<CR>", "Go definition", opts },
    ["<S-k>"] = { "<CMD>Lspsaga hover_doc<CR>", "Go definition", opts },
    ["ga"] = { "<CMD>Lspsaga code_action<CR>", "Go definition", opts },
    ["gD"] = { "<CMD>Lspsaga goto_definition<CR>", "Go definition", opts },
  },
}

M.tree_climber = {
  -- plugin=true,
  n = {
    ["gp"] = {
      function()
        require("tree-climber").goto_parent()
      end,
      "Go parent",
      opts2,
    },

    ["gcc"] = {
      function()
        require("tree-climber").goto_child()
      end,
      "Go child",
      opts2,
    },

    ["gn"] = {
      function()
        require("tree-climber").goto_next { skip_comments = true }
      end,
      "Go to next sybling",
      opts2,
    },

    ["gN"] = {
      function()
        require("tree-climber").goto_prev { skip_comments = true }
      end,
      "Go to previous sybling",
      opts2,
    },
  },
}

M.cmake = {
  n = {
    ["\\g"] = {"<CMD> CMakeGenerate <CR>" , "generate cmake", opts },
    ["\\b"] = {"<CMD> CMakeBuild <CR>" , "build cmake", opts },
    -- ["\\r"] = {"<CMD> CMakeRun <CR>" , "run cmake", opts },
    ["\\c"] = {"<CMD> CMakeClose <CR>" , "close cmake ", opts },
    ["\\s"] = {"<CMD> CMakeStop <CR>" , "stop cmake ", opts },
    ["\\o"] = {"<CMD> CMakeOpen <CR>" , "stop cmake ", opts },
  },
}

return M
