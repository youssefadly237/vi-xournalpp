local api = require("api.api")

return {
  -- Navigation
  goToTop = {
    description = "Go to Top",
    buttons = { "g" },
    modes = { "navigation" },
    call = api.ClickGoToFirstPage,
  },
  goToBottom = {
    description = "Go to Bottom",
    buttons = { "<Shift>g" },
    modes = { "navigation" },
    call = api.ClickGoToLastPage,
  },
  scrollPageDown = {
    description = "Scroll Page Down",
    buttons = { "<Ctrl>d" },
    modes = { "navigation" },
    call = api.ClickScrollPageDown,
  },
  scrollPageUp = {
    description = "Scroll Page Up",
    buttons = { "<Ctrl>u" },
    modes = { "navigation" },
    call = api.ClickScrollPageUp,
  },
  -- Zoom functions
  zoomIn = {
    description = "Zoom In",
    buttons = { "<Ctrl>plus" },
    modes = { "navigation" },
    call = api.ClickZoomIn,
  },
  zoomOut = {
    description = "Zoom Out",
    buttons = { "<Ctrl>minus" },
    modes = { "navigation" },
    call = api.ClickZoomOut,
  },
}
