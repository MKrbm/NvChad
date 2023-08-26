require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
-- vim.api.nvim_set_keymap('i', '<C-C>', '<Esc>', { noremap = true, silent = true })
vim.cmd([[
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn cursorline
  autocmd WinLeave * setlocal nocursorcolumn nocursorline
augroup END
]])
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_browser = ""
vim.g.mkdp_port = "8899"
vim.g.mkdp_open_to_the_world = 1
vim.g.mkdp_open_ip = "127.0.0.1"


-- vim.opt.spell = true
-- vim.opt.spelllang = '' 

