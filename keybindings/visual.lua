local api = require("api.api")

return {
  -- Visual mode selections
  lasso = {
    description = "Lasso Selection",
    buttons = { "l" },
    modes = { "visual" },
    call = function()
      api.ClickSelectRegion()
    end,
  },
  selectRectangle = {
    description = "Rectangle Selection",
    buttons = { "e" },
    modes = { "visual" },
    call = function()
      api.ClickSelectRectangle()
    end,
  },
}
