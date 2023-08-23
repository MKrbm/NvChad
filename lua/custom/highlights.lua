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
}
---@type HLTable
M.add = {

  NormalNC = {
    bg = "darker_black",
    fg = "",
    sp = "",
  },

  Normal = {
    bg = "black",
    fg = "",
    sp = "",
  },

  GlanceWinBarFilename = { fg = "lightbg", bold=true },
  glancewinbarfilepath = { fg = "lightbg", italic = true },
  glancewinbartitle = { fg = "teal" , bold = true },
  glancelistcount = { fg = "grey_fg2"},
  glancelistfilepath = { link = "comment" },
  glancelistfilename = { fg = "blue" },
  glancelistmatch = { fg = "grey_fg2", bold=true },
  glancefoldicon = { fg = "green" },
}

return M
