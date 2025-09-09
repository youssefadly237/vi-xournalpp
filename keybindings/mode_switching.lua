local modes = require("core.modes")

return {
  -- Mode Selection Menu - Tab
  modeMenu = {
    description = "Mode Menu",
    buttons = { "Tab" },
    modes = {
      "tool",
      "edit",
      "color",
      "shape",
      "layer",
      "page",
      "file",
      "navigation",
    },
    call = function()
      modes.changeMode("mode", false)
    end,
  },

  -- From mode menu, select actual modes
  tool = {
    description = "Tool Mode",
    buttons = { "t" },
    modes = { "mode" },
    call = function()
      modes.changeMode("tool", true)
    end,
  },
  color = {
    description = "Color Mode",
    buttons = { "c" },
    modes = { "mode" },
    call = function()
      modes.changeMode("color", false)
    end,
  },
  shape = {
    description = "Shape Mode",
    buttons = { "s" },
    modes = { "mode" },
    call = function()
      modes.changeMode("shape", false)
    end,
  },
  page = {
    description = "Page Mode",
    buttons = { "q" },
    modes = { "mode" },
    call = function()
      modes.changeMode("page", false)
    end,
  },
  navigation = {
    description = "Navigation Mode",
    buttons = { "v" },
    modes = { "mode" },
    call = function()
      modes.changeMode("navigation", false)
    end,
  },
  file = {
    description = "File Mode",
    buttons = { "f" },
    modes = { "mode" },
    call = function()
      modes.changeMode("file", false)
    end,
  },
  edit = {
    description = "Edit Mode",
    buttons = { "e" },
    modes = { "mode" },
    call = function()
      modes.changeMode("edit", false)
    end,
  },
  layer = {
    description = "Layer Mode",
    buttons = { "w" },
    modes = { "mode" },
    call = function()
      modes.changeMode("layer", false)
    end,
  },
  -- Sticky Mode Selection (Shift + key from mode menu)
  -- Note: Tool mode is always sticky, so no separate sticky tool option needed
  stickyColor = {
    description = "Sticky Color Mode",
    buttons = { "<Shift>c" },
    modes = { "mode" },
    call = function()
      modes.changeMode("color", true)
    end,
  },
  stickyShape = {
    description = "Sticky Shape Mode",
    buttons = { "<Shift>s" },
    modes = { "mode" },
    call = function()
      modes.changeMode("shape", true)
    end,
  },
  stickyPage = {
    description = "Sticky Page Mode",
    buttons = { "<Shift>q" },
    modes = { "mode" },
    call = function()
      modes.changeMode("page", true)
    end,
  },
  stickyNavigation = {
    description = "Sticky Navigation Mode",
    buttons = { "<Shift>v" },
    modes = { "mode" },
    call = function()
      modes.changeMode("navigation", true)
    end,
  },
  stickyFile = {
    description = "Sticky File Mode",
    buttons = { "<Shift>f" },
    modes = { "mode" },
    call = function()
      modes.changeMode("file", true)
    end,
  },
  stickyEdit = {
    description = "Sticky Edit Mode",
    buttons = { "<Shift>e" },
    modes = { "mode" },
    call = function()
      modes.changeMode("edit", true)
    end,
  },
  stickyLayer = {
    description = "Sticky Layer Mode",
    buttons = { "<Shift>w" },
    modes = { "mode" },
    call = function()
      modes.changeMode("layer", true)
    end,
  },
}
