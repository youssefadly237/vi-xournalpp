local api = require("api.api")
local utils = require("core.utils")

return {
  -- Primary tools
  pen = {
    description = "Pen",
    buttons = { "w" },
    modes = { "tool" },
    call = function()
      api.ClickPen()
      utils.cleanShape()
    end,
  },
  eraser = {
    description = "Eraser",
    buttons = { "e" },
    modes = { "tool" },
    call = function()
      api.ClickEraser()
      utils.cleanShape()
    end,
  },
  highlighter = {
    description = "Highlighter",
    buttons = { "f" },
    modes = { "tool" },
    call = function()
      api.ClickHighlighter()
      utils.cleanShape()
    end,
  },
  laserPen = {
    description = "Laser Pen",
    buttons = { "<Shift>w" },
    modes = { "tool" },
    call = function()
      ClickLaserPen()
      utils.cleanShape()
    end,
  },
  laserHighlighter = {
    description = "Laser Highlighter",
    buttons = { "<Shift>f" },
    modes = { "tool" },
    call = function()
      api.ClickLaserHighlighter()
      utils.cleanShape()
    end,
  },
  hand = {
    description = "Hand (Scroll)",
    buttons = { "<Shift>d" },
    modes = { "tool" },
    call = function()
      api.ClickHand()
      utils.cleanShape()
    end,
  },

  -- Color cycling
  nextColor = {
    description = "Next Color",
    buttons = { "r" },
    modes = { "tool" },
    call = function()
      utils.nextColor()
    end,
  },
  previousColor = {
    description = "Previous Color",
    buttons = { "q" },
    modes = { "tool" },
    call = function()
      utils.previousColor()
    end,
  },

  -- Basic Selection
  selectRect = {
    description = "Rectangle Selection",
    buttons = { "s" },
    modes = { "tool" },
    call = function()
      api.ClickSelectRectangle()
      utils.cleanShape()
    end,
  },
  selection = {
    description = "Lasso Selection",
    buttons = { "<Shift>s" },
    modes = { "tool" },
    call = function()
      api.ClickSelectRegion()
      utils.cleanShape()
    end,
  },
  selectTextLinear = {
    description = "Select Linear Text",
    buttons = { "d" },
    modes = { "tool" },
    call = function()
      api.ClickSelectTextLinear()
      utils.cleanShape()
    end,
  },

  -- Edit (Bottom Row)
  undo = {
    description = "Undo",
    buttons = { "z" },
    modes = { "tool" },
    call = function()
      api.ClickUndo()
    end,
  },
  redo = {
    description = "Redo",
    buttons = { "<shift>z" },
    modes = { "tool" },
    call = function()
      api.ClickRedo()
    end,
  },
  cut = {
    description = "Cut",
    buttons = { "x" },
    modes = { "tool" },
    call = function()
      api.ClickCut()
    end,
  },
  delete = {
    description = "Delete",
    buttons = { "<Shift>x" },
    modes = { "tool" },
    call = function()
      api.ClickDelete()
    end,
  },
  copy = {
    description = "Copy",
    buttons = { "c" },
    modes = { "tool" },
    call = function()
      api.ClickCopy()
    end,
  },
  paste = {
    description = "Paste",
    buttons = { "v" },
    modes = { "tool" },
    call = function()
      api.ClickPaste()
    end,
  },

  -- Linestyle cycling
  cycleLinestyle = {
    description = "Cycle Linestyle",
    buttons = { "a" },
    modes = { "tool" },
    call = function()
      utils.cycleLinestyle()
    end,
  },
  setPlainLinestyle = {
    description = "Set Plain Linestyle",
    buttons = { "<Shift>a" },
    modes = { "tool" },
    call = function()
      utils.setPlainLinestyle()
    end,
  },

  -- Thickness (T t g b B)
  veryFine = {
    description = "Very Fine",
    buttons = { "<Shift>t" },
    modes = { "tool" },
    call = function()
      api.ClickVeryFine()
    end,
  },
  fine = {
    description = "Fine",
    buttons = { "t" },
    modes = { "tool" },
    call = function()
      api.ClickFine()
    end,
  },
  medium = {
    description = "Medium",
    buttons = { "g" },
    modes = { "tool" },
    call = function()
      api.ClickMedium()
    end,
  },
  thick = {
    description = "Thick",
    buttons = { "b" },
    modes = { "tool" },
    call = function()
      api.ClickThick()
    end,
  },
  veryThick = {
    description = "Very Thick",
    buttons = { "<Shift>b" },
    modes = { "tool" },
    call = function()
      api.ClickVeryThick()
    end,
  },
}
