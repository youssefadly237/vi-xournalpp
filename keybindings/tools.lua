local api = require("api.api")
local utils = require("core.utils")

return {
  pen = {
    description = "Pen",
    buttons = { "w" },
    modes = { "tool" },
    call = function()
      api.clickPen()
      utils.cleanShape()
      api.clickPlain()
    end,
  },
  eraser = {
    description = "Eraser",
    buttons = { "e" },
    modes = { "tool" },
    call = function()
      api.clickEraser()
      utils.cleanShape()
    end,
  },
  tex = {
    description = "LaTeX",
    buttons = { "n" },
    modes = { "tool" },
    call = function()
      api.clickTex()
      utils.cleanShape()
    end,
  },
  hand = {
    description = "Hand (Scroll)",
    buttons = { "s" },
    modes = { "tool" },
    call = function()
      api.clickHand()
      utils.cleanShape()
    end,
  },
  delete = {
    description = "Delete",
    buttons = { "d" },
    modes = { "tool" },
    call = function()
      api.clickDelete()
    end,
  },
  highlighter = {
    description = "Highlighter",
    buttons = { "f" },
    modes = { "tool" },
    call = function()
      api.clickHighlighter()
      utils.cleanShape()
      api.clickPlain()
    end,
  },

  -- Bottom Row (Z X C V)
  -- Z reserved for thickness
  text = {
    description = "Text",
    buttons = { "x" },
    modes = { "tool" },
    call = function()
      api.clickText()
      utils.cleanShape()
    end,
  },
  -- C reserved for color mode access via m->c
  selection = {
    description = "Lasso Selection",
    buttons = { "v" },
    modes = { "tool" },
    call = function()
      api.clickSelectRegion()
      utils.cleanShape()
    end,
  },

  -- Additional tool
  selectRect = {
    description = "Rectangle Selection",
    buttons = { "i" },
    modes = { "tool" },
    call = function()
      api.clickSelectRectangle()
      utils.cleanShape()
    end,
  },

  -- History
  undo = {
    description = "Undo",
    buttons = { "z" },
    modes = { "tool" },
    call = function()
      api.clickUndo()
    end,
  },
  redo = {
    description = "Redo",
    buttons = { "<Ctrl>r" },
    modes = { "tool" },
    call = function()
      api.clickRedo()
    end,
  },

  -- Thickness (T t g b B)
  veryFine = {
    description = "Very Fine",
    buttons = { "<Shift>t" },
    modes = { "tool" },
    call = function()
      api.clickVeryFine()
    end,
  },
  fine = {
    description = "Fine",
    buttons = { "t" },
    modes = { "tool" },
    call = function()
      api.clickFine()
    end,
  },
  medium = {
    description = "Medium",
    buttons = { "g" },
    modes = { "tool" },
    call = function()
      api.clickMedium()
    end,
  },
  thick = {
    description = "Thick",
    buttons = { "b" },
    modes = { "tool" },
    call = function()
      api.clickThick()
    end,
  },
  veryThick = {
    description = "Very Thick",
    buttons = { "<Shift>b" },
    modes = { "tool" },
    call = function()
      api.clickVeryThick()
    end,
  },
}
