return {
  "petertriho/nvim-scrollbar",
  enabled = false,
  event = "LazyFile",
  config = function()
    require("scrollbar").setup()
  end,
}
