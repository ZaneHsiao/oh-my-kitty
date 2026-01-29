-- bootstrap lazy.nvim, LazyVim and your plugins
local shada_dir = vim.fn.stdpath("config") .. "/.state/shada"
vim.fn.mkdir(shada_dir, "p")
vim.opt.shadafile = shada_dir .. "/main.shada"

require("config.lazy")
