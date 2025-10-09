local api = require("api.api")
local utils = require("core.utils")

return {
  -- Primary tools
  pen = {
    description = "Pen",
    buttons = { "w" },
    modes = { "tool" },
    call = api.ClickPen,
  },
  eraser = {
    description = "Eraser",
    buttons = { "e" },
    modes = { "tool" },
    call = api.ClickEraser,
  },
  highlighter = {
    description = "Highlighter",
    buttons = { "f" },
    modes = { "tool" },
    call = api.ClickHighlighter,
  },
  laserPen = {
    description = "Laser Pen",
    buttons = { "<Shift>w" },
    modes = { "tool" },
    call = api.ClickLaserPen,
  },
  laserHighlighter = {
    description = "Laser Highlighter",
    buttons = { "<Shift>f" },
    modes = { "tool" },
    call = api.ClickLaserHighlighter,
  },
  hand = {
    description = "Hand (Scroll)",
    buttons = { "<Shift>d" },
    modes = { "tool" },
    call = api.ClickHand,
  },

  -- Color cycling
  nextColor = {
    description = "Next Color",
    buttons = { "r" },
    modes = { "tool" },
    call = utils.nextColor,
  },
  previousColor = {
    description = "Previous Color",
    buttons = { "q" },
    modes = { "tool" },
    call = utils.previousColor,
  },

  -- Basic Selection
  selectRect = {
    description = "Rectangle Selection",
    buttons = { "s" },
    modes = { "tool" },
    call = api.ClickSelectRectangle,
  },
  selection = {
    description = "Lasso Selection",
    buttons = { "<Shift>s" },
    modes = { "tool" },
    call = api.ClickSelectRegion,
  },
  selectTextLinear = {
    description = "Select Linear Text",
    buttons = { "d" },
    modes = { "tool" },
    call = api.ClickSelectTextLinear,
  },

  -- Edit (Bottom Row)
  undo = {
    description = "Undo",
    buttons = { "z" },
    modes = { "tool" },
    call = api.ClickUndo,
  },
  redo = {
    description = "Redo",
    buttons = { "<shift>z" },
    modes = { "tool" },
    call = api.ClickRedo,
  },
  cut = {
    description = "Cut",
    buttons = { "x" },
    modes = { "tool" },
    call = api.ClickCut,
  },
  delete = {
    description = "Delete",
    buttons = { "<Shift>x" },
    modes = { "tool" },
    call = api.ClickDelete,
  },
  copy = {
    description = "Copy",
    buttons = { "c" },
    modes = { "tool" },
    call = api.ClickCopy,
  },
  paste = {
    description = "Paste",
    buttons = { "v" },
    modes = { "tool" },
    call = api.ClickPaste,
  },

  -- Linestyle cycling
  cycleLinestyle = {
    description = "Cycle Linestyle",
    buttons = { "a" },
    modes = { "tool" },
    call = utils.cycleLinestyle,
  },
  setPlainLinestyle = {
    description = "Set Plain Linestyle",
    buttons = { "<Shift>a" },
    modes = { "tool" },
    call = utils.setPlainLinestyle,
  },

  -- Thickness (T t g b B)
  veryFine = {
    description = "Very Fine",
    buttons = { "<Shift>t" },
    modes = { "tool" },
    call = api.ClickVeryFine,
  },
  fine = {
    description = "Fine",
    buttons = { "t" },
    modes = { "tool" },
    call = api.ClickFine,
  },
  medium = {
    description = "Medium",
    buttons = { "g" },
    modes = { "tool" },
    call = api.ClickMedium,
  },
  thick = {
    description = "Thick",
    buttons = { "b" },
    modes = { "tool" },
    call = api.ClickThick,
  },
  veryThick = {
    description = "Very Thick",
    buttons = { "<Shift>b" },
    modes = { "tool" },
    call = api.ClickVeryThick,
  },
}
