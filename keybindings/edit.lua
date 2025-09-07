local api = require("api.api")

return {
  -- Edit mode
  lasso = {
    description = "Lasso Selection",
    buttons = { "e" },
    modes = { "edit" },
    call = function()
      api.ClickSelectRegion()
    end,
  },
  selectRectangle = {
    description = "Rectangle Selection",
    buttons = { "r" },
    modes = { "edit" },
    call = function()
      api.ClickSelectRectangle()
    end,
  },
  text = {
    description = "Text",
    buttons = { "f" },
    modes = { "edit" },
    call = function()
      api.ClickText()
    end,
  },
  tex = {
    description = "LaTeX",
    buttons = { "s" },
    modes = { "edit" },
    call = function()
      api.ClickTex()
    end,
  },
  image = {
    description = "Image",
    buttons = { "d" },
    modes = { "edit" },
    call = function()
      api.ClickImage()
    end,
  },
  selectFont = {
    description = "Font",
    buttons = { "w" },
    modes = { "edit" },
    call = function()
      api.ClickSelectFont()
    end,
  },
}
