local api = require("api.api")

return {
  layerUp = {
    description = "Layer Up",
    buttons = { "k" },
    modes = { "navigation" },
    call = function()
      api.ClickLayerUp()
    end,
  },
  layerDown = {
    description = "Layer Down",
    buttons = { "j" },
    modes = { "navigation" },
    call = function()
      api.ClickLayerDown()
    end,
  },
}
