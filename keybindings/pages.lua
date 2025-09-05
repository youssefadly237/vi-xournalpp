local api = require("api.api")

return {
  -- Page operations
  copyPage = {
    description = "Copy Page",
    buttons = { "c" },
    modes = { "page" },
    call = function()
      api.clickCopyPage()
    end,
  },
  moveUp = {
    description = "Move Page Up",
    buttons = { "k" },
    modes = { "page" },
    call = function()
      api.clickMoveUp()
    end,
  },
  moveDown = {
    description = "Move Page Down",
    buttons = { "j" },
    modes = { "page" },
    call = function()
      api.clickMoveDown()
    end,
  },
  newBefore = {
    description = "New Page Before",
    buttons = { "<Shift>o" },
    modes = { "page" },
    call = function()
      api.clickNewBefore()
    end,
  },
  newAfter = {
    description = "New Page After",
    buttons = { "o" },
    modes = { "page" },
    call = function()
      api.clickNewAfter()
    end,
  },
  newLayer = {
    description = "New Layer",
    buttons = { "l" },
    modes = { "page" },
    call = function()
      api.clickNewLayer()
    end,
  },

  -- Background types
  ruledBG = {
    description = "Ruled Background",
    buttons = { "r" },
    modes = { "page" },
    call = function()
      api.clickRuledBG()
    end,
  },
  graphBG = {
    description = "Graph Background",
    buttons = { "g" },
    modes = { "page" },
    call = function()
      api.clickGraphBG()
    end,
  },
  isoGraphBG = {
    description = "Isometric Graph Background",
    buttons = { "i" },
    modes = { "page" },
    call = function()
      api.clickIsometricGraphBG()
    end,
  },
  dottedGraphBG = {
    description = "Dotted Graph Background",
    buttons = { "d" },
    modes = { "page" },
    call = function()
      api.clickDottedGraphBG()
    end,
  },
  isodottedGraphBG = {
    description = "Isometric Dotted Graph Background",
    buttons = { "<Shift>i" },
    modes = { "page" },
    call = function()
      api.clickIsometricDottedGraphBG()
    end,
  },
  plainBG = {
    description = "Plain Background",
    buttons = { "p" },
    modes = { "page" },
    call = function()
      api.clickPlainBG()
    end,
  },

  -- Quick access from tool mode
  newPageAfterTool = {
    description = "New Page After (Quick Access)",
    buttons = { "o" },
    modes = { "tool" },
    call = function()
      api.clickNewAfter()
    end,
  },
}
