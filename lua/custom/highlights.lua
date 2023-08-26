-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
    sp = "",
    fg = "",
    bg = "",
  },

  NvimTreeWinSeparator = {
    bg = "gray",
    fg = "line",
    bold = true,
  },

  VertSplit = {
    bg = "pink",
    fg = "pink",
  },
  CursorColumn = {
    bg = "darker_black",
  },
  CursorLine = {
    bg = "black2",
  },
  SpellBad = {
    undercurl = true,
    -- cterm = ""
  },
  -- PreviewNormal = { fg = "green", bg = "green"  },
  -- PreviewLineNr = { fg = "green", bg = "green"  },
  -- NormalFloat = { fg = "green", bg = "green"  },
}
---@type HLTable
M.add = {

  -- SpellBad = {
  --   ctermfg = "red",
  --   ctermbg = "red",
  -- },

  NormalNC = {
    bg = "darker_black",
    fg = "",
    sp = "",
  },

  TermCorsorNC = {
    bg = "pink",
    fg = "pink",
  },

  Normal = {
    bg = "black",
    fg = "",
    sp = "",
  },

  IlluminatedWordWrite = {
    underline = false,
    undercurl = false,
    bg = "one_bg",
  },

  IlluminatedWordText = {
    underline = false,
    undercurl = false,
    bg = "one_bg",
  },
  -- },
  -- GlanceWinBarFilename = { fg = "grey", bold=true },
  -- glancewinbarfilepath = { fg = "grey", italic = true },
  -- glancewinbartitle = { fg = "teal" , bold = true },
  -- glancelistcount = { fg = "grey_fg2"},
  -- glancelistfilepath = { link = "grey" },
  -- glancelistfilname = { fg = "blue" },
  -- glancelistmatch = { fg = "grey_fg2", bold=true },
  -- glancefoldicon = { fg = "green" },
  GlancePreviewNormal = { bg = "darker_black" },
  GlanceListNormal = { bg = "black2" },
  -- GlancePreviewMatch = { bg = "grey"  },
}

return M
