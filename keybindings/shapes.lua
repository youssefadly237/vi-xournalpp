local api = require("api.api")
local modes = require("core.modes")

return {
  -- Shape Tools
  ruler = {
    description = "Ruler",
    buttons = { "r" },
    modes = { "shape" },
    call = function()
      api.clickRuler(true)
    end,
  },
  arrow = {
    description = "Arrow",
    buttons = { "a" },
    modes = { "shape" },
    call = function()
      api.clickArrow(true)
    end,
  },
  rectangle = {
    description = "Rectangle",
    buttons = { "s" },
    modes = { "shape" },
    call = function()
      api.clickRectangle(true)
    end,
  },
  ellipse = {
    description = "Ellipse",
    buttons = { "e" },
    modes = { "shape" },
    call = function()
      api.clickEllipse(true)
    end,
  },
  spline = {
    description = "Spline",
    buttons = { "v" },
    modes = { "shape" },
    call = function()
      api.clickSpline(true)
    end,
  },
  fill = {
    description = "Fill",
    buttons = { "f" },
    modes = { "shape" },
    call = function()
      api.clickFill(true)
    end,
  },

  -- Linestyles
  plain = {
    description = "Plain Line",
    buttons = { "p" },
    modes = { "linestyle" },
    call = function()
      api.clickPlain()
    end,
  },
  dashed = {
    description = "Dashed Line",
    buttons = { "d" },
    modes = { "linestyle" },
    call = function()
      api.clickDashed()
    end,
  },
  dotted = {
    description = "Dotted Line",
    buttons = { "o" },
    modes = { "linestyle" },
    call = function()
      api.clickDotted()
    end,
  },
  dashDotted = {
    description = "Dash-Dotted Line",
    buttons = { "a" },
    modes = { "linestyle" },
    call = function()
      api.clickDashDotted()
    end,
  },
}
