-- Compatibility shim for plugins expecting `nvim-treesitter.query_predicates`.
-- Recent nvim-treesitter versions only ship the runtime plugin file.
pcall(vim.cmd.runtime, { "plugin/query_predicates.lua", bang = true })

return {}
