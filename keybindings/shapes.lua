local api = require("api.api")
local utils = require("core.utils")

return {
  -- Shape Tools
  ruler = {
    description = "Ruler",
    buttons = { "q" },
    modes = { "shape" },
    call = api.ClickLine,
  },
  coordinateSystem = {
    description = "Coordinate system",
    buttons = { "w" },
    modes = { "shape" },
    call = api.ClickCoordinateSystem,
  },
  arrow = {
    description = "Arrow",
    buttons = { "a" },
    modes = { "shape" },
    call = api.ClickArrow,
  },
  doubleArrow = {
    description = "Double Arrow",
    buttons = { "<Shift>a" },
    modes = { "shape" },
    call = api.ClickDoubleArrow,
  },
  rectangle = {
    description = "Rectangle",
    buttons = { "r" },
    modes = { "shape" },
    call = api.ClickRectangle,
  },
  ellipse = {
    description = "Ellipse",
    buttons = { "e" },
    modes = { "shape" },
    call = api.ClickEllipse,
  },
  spline = {
    description = "Spline",
    buttons = { "s" },
    modes = { "shape" },
    call = api.ClickSpline,
  },
  ShapeRecognizer = {
    description = "Shape Detector",
    buttons = { "d" },
    modes = { "shape" },
    call = api.ClickShapeRecognizer,
  },
  fill = {
    description = "Fill",
    buttons = { "f" },
    modes = { "shape" },
    call = api.ClickFill,
  },
  penFillOpacity = {
    description = "Pen fill opacity",
    buttons = { "v" },
    modes = { "shape" },
    call = api.ClickPenFillOpacity,
  },
  highlighterFillOpacity = {
    description = "Highlighter fill opacity",
    buttons = { "<Shift>v" },
    modes = { "shape" },
    call = api.ClickHighlighterFillOpacity,
  },
  cleanShape = {
    description = "Deselect all shape tools",
    buttons = { "c" },
    modes = { "shape" },
    call = utils.cleanShape,
  },
  protractor = {
    description = "Protractor",
    buttons = { "z" },
    modes = { "shape" },
    call = api.ClickProtractor,
  },
  setsquare = {
    description = "Set square (triangle)",
    buttons = { "x" },
    modes = { "shape" },
    call = api.ClickSetsquare,
  },
  verticalSpace = {
    description = "Vertical Space",
    buttons = { "t" },
    modes = { "shape" },
    call = api.ClickVerticalSpace,
  },
  gridSnip = {
    description = "Grid snipping",
    buttons = { "g" },
    modes = { "shape" },
    call = api.ClickGridSnapping,
  },
  rotateSnip = {
    description = "Rotation snipping",
    buttons = { "b" },
    modes = { "shape" },
    call = api.ClickRotationSnapping,
  },
}
