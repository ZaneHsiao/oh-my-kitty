-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Replace LazyVim notification title with ZANEVIM
if not vim.g.zanevim_notify_wrapped then
  local orig_notify = vim.notify
  vim.notify = function(msg, level, opts)
    if opts and opts.title == "LazyVim" then
      opts = vim.tbl_extend("force", opts, { title = "ZANEVIM" })
    end
    return orig_notify(msg, level, opts)
  end
  vim.g.zanevim_notify_wrapped = true
end

-- Force normal file buffers to stay editable even if something flips them readonly.
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufEnter" }, {
  callback = function(args)
    if vim.bo[args.buf].buftype == "" then
      vim.bo[args.buf].modifiable = true
      vim.bo[args.buf].readonly = false
    end
  end,
})

-- Disable autoformat for lua files
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "shell", "bash", "sh" },
--   callback = function()
--     vim.b.autoformat = false
--   end,
-- })

-- Let kitty know when we're inside Neovim so it can pass through keys.
local kitty_var_group = vim.api.nvim_create_augroup("KittyUserVarInEditor", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "VimResume", "UIEnter" }, {
  group = kitty_var_group,
  callback = function()
    local seq = "\x1b]1337;SetUserVar=in_editor=MQo\007"
    if vim.api.nvim_ui_send then
      vim.api.nvim_ui_send(seq)
    else
      io.stdout:write(seq)
    end
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  group = kitty_var_group,
  callback = function()
    local seq = "\x1b]1337;SetUserVar=in_editor\007"
    if vim.api.nvim_ui_send then
      vim.api.nvim_ui_send(seq)
    else
      io.stdout:write(seq)
    end
  end,
})
