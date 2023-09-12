-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--
--
vim.opt.shell = "/bin/bash"
-- vim.o.clipboard = "unnamedplus"
vim.opt.laststatus = 2
-- vim.opt.fillchars:append("vert:▕")
-- vim.g.nvimtree_side = "right"
-- Initialize the augroup

--- Disable cursorcolumn for nvim-tree
vim.api.nvim_exec([[
  augroup NvimTreeCursorColumn
      autocmd!
      autocmd FileType NvimTree setlocal nocursorcolumn
  augroup END
]], false)

vim.cmd [[
  autocmd FileType * setlocal formatoptions-=cro
]]

