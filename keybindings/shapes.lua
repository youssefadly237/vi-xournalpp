local api = require("api.api")
local utils = require("core.utils")

return {
  -- Shape Tools
  ruler = {
    description = "Ruler",
    buttons = { "q" },
    modes = { "shape" },
    call = function()
      api.ClickRuler(true)
    end,
  },
  coordinateSystem = {
    description = "Coordinate system",
    buttons = { "w" },
    modes = { "shape" },
    call = function()
      api.ClickCoordinateSystem(true)
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
  doubleArrow = {
    description = "Double Arrow",
    buttons = { "<Shift>a" },
    modes = { "shape" },
    call = function()
      api.ClickDoubleArrow(true)
    end,
  },
  rectangle = {
    description = "Rectangle",
    buttons = { "r" },
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
    buttons = { "s" },
    modes = { "shape" },
    call = function()
      api.ClickSpline(true)
    end,
  },
  ShapeRecognizer = {
    description = "Shape Detector",
    buttons = { "d" },
    modes = { "shape" },
    call = function()
      api.ClickShapeRecognizer(true)
    end,
  },
  fill = {
    description = "Fill",
    buttons = { "f" },
    modes = { "shape" },
    call = function()
      utils.toggleFill()
    end,
  },
  penFillOpacity = {
    description = "Pen fill opacity",
    buttons = { "v" },
    modes = { "shape" },
    call = function()
      api.ClickPenFillOpacity()
    end,
  },
  highlighterFillOpacity = {
    description = "Highlighter fill opacity",
    buttons = { "<Shift>v" },
    modes = { "shape" },
    call = function()
      api.ClickHighlighterFillOpacity()
    end,
  },
  cleanShape = {
    description = "Deselect all shape tools",
    buttons = { "c" },
    modes = { "shape" },
    call = function()
      utils.cleanShape()
    end,
  },
  protractor = {
    description = "Protractor",
    buttons = { "z" },
    modes = { "shape" },
    call = function()
      api.ClickProtractor()
    end,
  },
  setsquare = {
    description = "Set square (triangle)",
    buttons = { "x" },
    modes = { "shape" },
    call = function()
      api.ClickSetsquare()
    end,
  },
  verticalSpace = {
    description = "Vertical Space",
    buttons = { "t" },
    modes = { "shape" },
    call = function()
      api.ClickVerticalSpace()
    end,
  },
  gridSnip = {
    description = "Grid snipping",
    buttons = { "g" },
    modes = { "shape" },
    call = function()
      api.ClickGridSnapping(true)
    end,
  },
  rotateSnip = {
    description = "Rotation snipping",
    buttons = { "b" },
    modes = { "shape" },
    call = function()
      api.ClickRotationSnapping(true)
    end,
  },
  gridSnipOff = {
    description = "Grid snipping off",
    buttons = { "<Shift>g" },
    modes = { "shape" },
    call = function()
      api.ClickGridSnapping(false)
    end,
  },
  rotateSnipoff = {
    description = "Rotation snipping off",
    buttons = { "<Shift>b" },
    modes = { "shape" },
    call = function()
      api.ClickRotationSnapping(false)
    end,
  },
}
