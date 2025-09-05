local api = require("api.api")

return {
  -- Navigation
  goToTop = {
    description = "Go to Top",
    buttons = { "g" },
    modes = { "navigation" },
    call = function()
      api.clickGoToTop()
    end,
  },
  goToBottom = {
    description = "Go to Bottom",
    buttons = { "<Shift>g" },
    modes = { "navigation" },
    call = function()
      api.clickGoToBottom()
    end,
  },
  scrollPageDown = {
    description = "Scroll Page Down",
    buttons = { "<Ctrl>d" },
    modes = { "navigation" },
    call = function()
      api.clickScrollPageDown()
    end,
  },
  scrollPageUp = {
    description = "Scroll Page Up",
    buttons = { "<Ctrl>u" },
    modes = { "navigation" },
    call = function()
      api.clickScrollPageUp()
    end,
  },
  layerUp = {
    description = "Layer Up",
    buttons = { "k" },
    modes = { "navigation" },
    call = function()
      api.clickLayerUp()
    end,
  },
  layerDown = {
    description = "Layer Down",
    buttons = { "j" },
    modes = { "navigation" },
    call = function()
      api.clickLayerDown()
    end,
  },

  -- Zoom functions
  zoomIn = {
    description = "Zoom In",
    buttons = { "<Ctrl>plus" },
    modes = { "navigation" },
    call = function()
      api.clickZoomIn()
    end,
  },
  zoomOut = {
    description = "Zoom Out",
    buttons = { "<Ctrl>minus" },
    modes = { "navigation" },
    call = function()
      api.clickZoomOut()
    end,
  },
}
