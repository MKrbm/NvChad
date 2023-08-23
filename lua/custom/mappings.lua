---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>sf"] = {"<cmd> Telescope persisted<CR>", opts = {noremap = true, nowait = true}},
    ["<leader>ss"] = {"<cmd> SessionSave <CR>", opts = {noremap = true, nowait = true}},
    ["<leader>sl"] = {"<cmd> sessionLoad <CR>", opts = {noremap = true, nowait = true}},
  },
}

-- more keybinds!

return M
