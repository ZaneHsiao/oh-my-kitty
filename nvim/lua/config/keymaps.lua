-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
local set = vim.keymap.set

local function can_modify()
  return vim.bo.modifiable and not vim.bo.readonly
end

local function paste_clipboard()
  if not can_modify() then
    return
  end
  if vim.fn.mode():find("v") then
    vim.cmd([[normal! "+p]])
    return
  end
  vim.api.nvim_put(vim.fn.getreg("+", 1, true), "c", true, true)
end

local function cut_clipboard()
  if not can_modify() then
    return
  end
  vim.cmd([[normal! "+d]])
end

set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>", { desc = "Navigate Left", silent = true })
set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>", { desc = "Navigate Right", silent = true })
set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>", { desc = "Navigate Up", silent = true })
set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>", { desc = "Navigate Down", silent = true })

-- macOS Command key clipboard mappings removed in favor of <C-S-*> mappings

set("n", "<leader>kk", "<CMD>w<CR><ESC>", { desc = "Save File", noremap = true, silent = true, nowait = true })
set("n", "<leader>wq", "<CMD>wq<CR>", { desc = "Save File And Quit", silent = true, noremap = true, nowait = true })
set("n", "<leader>dd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer", silent = true, noremap = true, nowait = true })

set("n", "i", function()
  return string.match(vim.api.nvim_get_current_line(), "%g") == nil and "cc" or "i"
end, { expr = true, noremap = true })

-- System clipboard
vim.opt.clipboard = "unnamedplus"

-- ===== Helpers =====
local function select_all()
  vim.cmd("normal! ggVG")
end

-- ===== Mac-style keybinds (Kitty: Cmd -> Ctrl+Shift) =====
-- 所以这里绑定 Ctrl+Shift+*

-- 全选
set({ "n", "i" }, "<C-S-a>", function()
  select_all()
end, { desc = "Select All" })
set({ "n", "i" }, "<D-a>", function()
  select_all()
end, { desc = "Select All" })

-- 复制（visual）
set("v", "<C-S-c>", '"+y', { desc = "Copy to system clipboard" })
set("v", "<D-c>", '"+y', { desc = "Copy to system clipboard" })
set("n", "<C-S-c>", '"+yy', { desc = "Copy line to system clipboard" })
set("n", "<D-c>", '"+yy', { desc = "Copy line to system clipboard" })

-- 粘贴
set("n", "<C-S-v>", '"+p', { desc = "Paste from system clipboard" })
set("i", "<C-S-v>", "<C-r>+", { desc = "Paste from system clipboard" })
set("c", "<C-S-v>", "<C-r>+", { desc = "Paste in cmdline" })
set("v", "<C-S-v>", '"+p', { desc = "Paste from system clipboard" })
set("n", "<D-v>", '"+p', { desc = "Paste from system clipboard" })
set("i", "<D-v>", "<C-r>+", { desc = "Paste from system clipboard" })
set("c", "<D-v>", "<C-r>+", { desc = "Paste in cmdline" })
set("v", "<D-v>", '"+p', { desc = "Paste from system clipboard" })

-- 保存
set({ "n", "i" }, "<C-S-s>", "<cmd>w<cr>", { desc = "Save" })

-- 撤销
set("n", "<C-S-z>", "u", { desc = "Undo" })
set("i", "<C-S-z>", "<Esc>ui", { desc = "Undo (insert)" })
set("n", "<D-z>", "u", { desc = "Undo" })
set("i", "<D-z>", "<Esc>ui", { desc = "Undo (insert)" })
set("v", "<D-z>", "<Esc>u", { desc = "Undo" })

-- 搜索
set("n", "<C-S-f>", "/", { desc = "Search" })
set("i", "<C-S-f>", "<Esc>/", { desc = "Search" })
