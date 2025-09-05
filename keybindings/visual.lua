local api = require("api.api")

return {
  -- Visual mode selections
  lasso = {
    description = "Lasso Selection",
    buttons = { "l" },
    modes = { "visual" },
    call = function()
      api.clickSelectRegion()
    end,
  },
  selectRectangle = {
    description = "Rectangle Selection",
    buttons = { "r" },
    modes = { "visual" },
    call = function()
      api.clickSelectRectangle()
    end,
  },
  selectObject = {
    description = "Object Selection",
    buttons = { "o" },
    modes = { "visual" },
    call = function()
      api.clickSelectObject()
    end,
  },
}
