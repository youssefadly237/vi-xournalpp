local api = require("api.api")

return {
  layerUp = {
    description = "Layer Up",
    buttons = { "w" },
    modes = { "layer" },
    call = api.ClickLayerUp,
  },
  layerDown = {
    description = "Layer Down",
    buttons = { "s" },
    modes = { "layer" },
    call = api.ClickLayerDown,
  },
}
