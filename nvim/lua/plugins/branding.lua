local header = {
  "███████╗  █████╗  ███╗   ██╗ ███████╗ ██╗   ██╗ ██╗ ███╗   ███╗",
  "╚══███╔╝ ██╔══██╗ ████╗  ██║ ██╔════╝ ██║   ██║ ██║ ████╗ ████║",
  "  ███╔╝  ███████║ ██╔██╗ ██║ █████╗   ╚██╗ ██╔╝ ██║ ██╔████╔██║",
  " ███╔╝   ██╔══██║ ██║╚██╗██║ ██╔══╝   ╚████╔╝  ██║ ██║╚██╔╝██║",
  "███████╗ ██║  ██║ ██║ ╚████║ ███████╗   ╚██╔╝   ██║ ██║ ╚═╝ ██║",
  "╚══════╝ ╚═╝  ╚═╝ ╚═╝  ╚═══╝ ╚══════╝    ╚═╝    ╚═╝ ╚═╝     ╚═╝",
}
local header_text = table.concat(header, "\n")

return {
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      if type(dashboard) == "table" then
        dashboard.section = dashboard.section or {}
        dashboard.section.header = dashboard.section.header or {}
        dashboard.section.header.val = header
      end
      return dashboard
    end,
    init = function()
      if vim.g.zanevim_alpha_header then
        return
      end
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          local ok, dashboard = pcall(require, "alpha.themes.dashboard")
          if not ok then
            return
          end
          if dashboard.section and dashboard.section.header then
            dashboard.section.header.val = header
            pcall(vim.cmd.AlphaRedraw)
          end
        end,
      })
      vim.g.zanevim_alpha_header = true
    end,
  },
  {
    "nvim-mini/mini.starter",
    optional = true,
    opts = function(_, opts)
      opts.header = header_text
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = function(_, opts)
      opts.config = opts.config or {}
      opts.config.header = header
    end,
  },
  {
    "snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.preset.header = header_text
    end,
  },
}
