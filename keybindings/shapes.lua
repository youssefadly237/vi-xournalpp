local api = require("api.api")
local modes = require("core.modes")

return {
  -- Shape Tools
  ruler = {
    description = "Ruler",
    buttons = { "r" },
    modes = { "shape" },
    call = function()
      api.ClickRuler(true)
    end,
  },
  arrow = {
    description = "Arrow",
    buttons = { "a" },
    modes = { "shape" },
    call = function()
      api.ClickArrow(true)
    end,
  },
  rectangle = {
    description = "Rectangle",
    buttons = { "s" },
    modes = { "shape" },
    call = function()
      api.ClickRectangle(true)
    end,
  },
  ellipse = {
    description = "Ellipse",
    buttons = { "e" },
    modes = { "shape" },
    call = function()
      api.ClickEllipse(true)
    end,
  },
  spline = {
    description = "Spline",
    buttons = { "v" },
    modes = { "shape" },
    call = function()
      api.ClickSpline(true)
    end,
  },
  fill = {
    description = "Fill",
    buttons = { "f" },
    modes = { "shape" },
    call = function()
      api.ClickFill(true)
    end,
  },

  --   tex = {
  --   description = "LaTeX",
  --   buttons = { "n" },
  --   modes = { "tool" },
  --   call = function()
  --     api.ClickTex()
  --     utils.cleanShape()
  --   end,
  -- },

  -- text = {
  --   description = "Text",
  --   buttons = { "x" },
  --   modes = { "tool" },
  --   call = function()
  --     api.ClickText()
  --     utils.cleanShape()
  --   end,
  -- },
}
