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

  -- Linestyles
  plain = {
    description = "Plain Line",
    buttons = { "p" },
    modes = { "linestyle" },
    call = function()
      api.ClickPlain()
    end,
  },
  dashed = {
    description = "Dashed Line",
    buttons = { "d" },
    modes = { "linestyle" },
    call = function()
      api.ClickDashed()
    end,
  },
  dotted = {
    description = "Dotted Line",
    buttons = { "o" },
    modes = { "linestyle" },
    call = function()
      api.ClickDotted()
    end,
  },
  dashDotted = {
    description = "Dash-Dotted Line",
    buttons = { "a" },
    modes = { "linestyle" },
    call = function()
      api.ClickDashDotted()
    end,
  },
}
