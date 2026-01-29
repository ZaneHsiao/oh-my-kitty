return {
  {
    "sontungexpt/witch-line",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = { "BufEnter" },
    config = function()
      require("witch-line").setup({
        statusline_color = "StatusLine",
        laststatus = 3,
        disabled = {
          filetypes = {
            "NvimTree",
            "lazy",
            "mason",
          },
          buftypes = {
            "terminal",
          },
        },
        components = {
          "mode",
          "filename",
          "git-branch",
          "git-diff",
          "%=",
          "diagnostics",
          "lsps-formatters",
          "indent",
          "encoding",
          "pos-cursor",
          "pos-cursor-progress",
        },
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },
}
