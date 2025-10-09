local api = require("api.api")

return {
  -- Page operations
  copyPage = {
    description = "Copy Page",
    buttons = { "c" },
    modes = { "page" },
    call = api.ClickCopyPage,
  },
  moveUp = {
    description = "Move Page Up",
    buttons = { "k" },
    modes = { "page" },
    call = api.ClickMoveUp,
  },
  moveDown = {
    description = "Move Page Down",
    buttons = { "j" },
    modes = { "page" },
    call = api.ClickMoveDown,
  },
  newBefore = {
    description = "New Page Before",
    buttons = { "<Shift>o" },
    modes = { "page" },
    call = api.ClickNewBefore,
  },
  newAfter = {
    description = "New Page After",
    buttons = { "o" },
    modes = { "page" },
    call = api.ClickNewAfter,
  },
  newLayer = {
    description = "New Layer",
    buttons = { "l" },
    modes = { "page" },
    call = api.ClickNewLayer,
  },

  -- Background types
  ruledBG = {
    description = "Ruled Background",
    buttons = { "r" },
    modes = { "page" },
    call = api.ClickRuledBG,
  },
  graphBG = {
    description = "Graph Background",
    buttons = { "g" },
    modes = { "page" },
    call = api.ClickGraphBG,
  },
  isoGraphBG = {
    description = "Isometric Graph Background",
    buttons = { "i" },
    modes = { "page" },
    call = api.ClickIsometricGraphBG,
  },
  dottedGraphBG = {
    description = "Dotted Graph Background",
    buttons = { "d" },
    modes = { "page" },
    call = api.ClickDottedGraphBG,
  },
  isodottedGraphBG = {
    description = "Isometric Dotted Graph Background",
    buttons = { "<Shift>i" },
    modes = { "page" },
    call = api.ClickIsometricDottedGraphBG,
  },
  plainBG = {
    description = "Plain Background",
    buttons = { "p" },
    modes = { "page" },
    call = api.ClickPlainBG,
  },

  -- Quick access from tool mode
  newPageAfterTool = {
    description = "New Page After (Quick Access)",
    buttons = { "m" },
    modes = { "page" },
    call = api.ClickNewAfter,
  },
}
