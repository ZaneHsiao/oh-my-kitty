return {
  "numToStr/Navigator.nvim",
  cmd = {
    "NavigatorLeft",
    "NavigatorRight",
    "NavigatorUp",
    "NavigatorDown",
    "NavigatorPrevious",
    "NavigatorNext",
  },
  config = function()
    require("Navigator").setup()
  end,
}
