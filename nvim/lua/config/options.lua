-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.pumblend = 0
vim.opt.updatetime = 200
vim.opt.wrap = true
vim.opt.laststatus = 3
vim.opt.clipboard = "unnamedplus"

-- Store ShaDa under the config dir to avoid environments where stdpath("state")
-- is not writable (e.g. sandboxed runs).
local shada_dir = vim.fn.stdpath("config") .. "/.state/shada"
vim.fn.mkdir(shada_dir, "p")
vim.opt.shadafile = shada_dir .. "/main.shada"

vim.g.rustaceanvim = {
  tools = {
    float_win_config = {
      border = "rounded",
    },
  },
}
