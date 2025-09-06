local api = require("api.api")

return {
  -- Page operations
  copyPage = {
    description = "Copy Page",
    buttons = { "c" },
    modes = { "page" },
    call = function()
      api.ClickCopyPage()
    end,
  },
  moveUp = {
    description = "Move Page Up",
    buttons = { "k" },
    modes = { "page" },
    call = function()
      api.ClickMoveUp()
    end,
  },
  moveDown = {
    description = "Move Page Down",
    buttons = { "j" },
    modes = { "page" },
    call = function()
      api.ClickMoveDown()
    end,
  },
  newBefore = {
    description = "New Page Before",
    buttons = { "<Shift>o" },
    modes = { "page" },
    call = function()
      api.ClickNewBefore()
    end,
  },
  newAfter = {
    description = "New Page After",
    buttons = { "o" },
    modes = { "page" },
    call = function()
      api.ClickNewAfter()
    end,
  },
  newLayer = {
    description = "New Layer",
    buttons = { "l" },
    modes = { "page" },
    call = function()
      api.ClickNewLayer()
    end,
  },

  -- Background types
  ruledBG = {
    description = "Ruled Background",
    buttons = { "r" },
    modes = { "page" },
    call = function()
      api.ClickRuledBG()
    end,
  },
  graphBG = {
    description = "Graph Background",
    buttons = { "g" },
    modes = { "page" },
    call = function()
      api.ClickGraphBG()
    end,
  },
  isoGraphBG = {
    description = "Isometric Graph Background",
    buttons = { "i" },
    modes = { "page" },
    call = function()
      api.ClickIsometricGraphBG()
    end,
  },
  dottedGraphBG = {
    description = "Dotted Graph Background",
    buttons = { "d" },
    modes = { "page" },
    call = function()
      api.ClickDottedGraphBG()
    end,
  },
  isodottedGraphBG = {
    description = "Isometric Dotted Graph Background",
    buttons = { "<Shift>i" },
    modes = { "page" },
    call = function()
      api.ClickIsometricDottedGraphBG()
    end,
  },
  plainBG = {
    description = "Plain Background",
    buttons = { "p" },
    modes = { "page" },
    call = function()
      api.ClickPlainBG()
    end,
  },

  -- Quick access from tool mode
  newPageAfterTool = {
    description = "New Page After (Quick Access)",
    buttons = { "m" },
    modes = { "page" },
    call = function()
      api.ClickNewAfter()
    end,
  },
}
