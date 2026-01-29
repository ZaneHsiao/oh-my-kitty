return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function(plugin)
      -- Keep LazyVim's early rtp setup, but don't hard-fail if the module is missing
      require("lazy.core.loader").add_to_rtp(plugin)
      if not pcall(require, "nvim-treesitter.query_predicates") then
        pcall(vim.cmd.runtime, { "plugin/query_predicates.lua", bang = true })
      end
    end,
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_deep_extend("force", opts.ensure_installed, {

        "bash",
        "html",
        "javascript",
        "tsx",
        "typescript",
        "css",

        "json",
        "json5",
        "jsonc",

        "lua",
        "markdown",
        "markdown_inline",

        "python",
        "ninja",
        "rst",

        "query",
        "regex",
        "vim",
        "yaml",

        "go",
        "gomod",
        "gowork",
        "gosum",

        "rust",
        "toml",
        "ron",

        "dockerfile",
      })
    end,
  },
}
