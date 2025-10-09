local api = require("api.api")

return {
  -- Edit mode
  lasso = {
    description = "Lasso Selection",
    buttons = { "e" },
    modes = { "edit" },
    call = api.ClickSelectRegion,
  },
  selectRectangle = {
    description = "Rectangle Selection",
    buttons = { "r" },
    modes = { "edit" },
    call = api.ClickSelectRectangle,
  },
  text = {
    description = "Text",
    buttons = { "f" },
    modes = { "edit" },
    call = api.ClickText,
  },
  tex = {
    description = "LaTeX",
    buttons = { "s" },
    modes = { "edit" },
    call = api.ClickTex,
  },
  image = {
    description = "Image",
    buttons = { "d" },
    modes = { "edit" },
    call = api.ClickImage,
  },
  selectFont = {
    description = "Font",
    buttons = { "w" },
    modes = { "edit" },
    call = api.ClickSelectFont,
  },
}
