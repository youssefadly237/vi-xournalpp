local api = require("api.api")

return {
  -- Navigation
  goToTop = {
    description = "Go to Top",
    buttons = { "g" },
    modes = { "navigation" },
    call = function()
      api.ClickGoToFirstPage()
    end,
  },
  goToBottom = {
    description = "Go to Bottom",
    buttons = { "<Shift>g" },
    modes = { "navigation" },
    call = function()
      api.ClickGoToLastPage()
    end,
  },
  scrollPageDown = {
    description = "Scroll Page Down",
    buttons = { "<Ctrl>d" },
    modes = { "navigation" },
    call = function()
      api.ClickScrollPageDown()
    end,
  },
  scrollPageUp = {
    description = "Scroll Page Up",
    buttons = { "<Ctrl>u" },
    modes = { "navigation" },
    call = function()
      api.ClickScrollPageUp()
    end,
  },
  -- Zoom functions
  zoomIn = {
    description = "Zoom In",
    buttons = { "<Ctrl>plus" },
    modes = { "navigation" },
    call = function()
      api.ClickZoomIn()
    end,
  },
  zoomOut = {
    description = "Zoom Out",
    buttons = { "<Ctrl>minus" },
    modes = { "navigation" },
    call = function()
      api.ClickZoomOut()
    end,
  },
}
