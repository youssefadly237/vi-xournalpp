local modes = require("core.modes")

return {
  modeMenu = {
    description = "Mode Menu",
    buttons = { "Tab" },
    modes = { "tool", "edit", "color", "shape", "layer", "page", "file", "navigation" },
    call = function()
      modes.changeMode("mode", false)
    end,
  },
  stickyMenu = {
    description = "Sticky Mode Menu",
    buttons = { "Tab" },
    modes = { "mode" },
    call = function()
      modes.changeMode("sticky_select", false)
    end,
  },
  toolMode = {
    description = "Tool Mode",
    buttons = { "Tab" },
    modes = { "sticky_select" },
    call = function()
      modes.changeMode("tool", true)
    end,
  },
  tool = {
    description = "Tool Mode",
    buttons = { "t" },
    modes = { "mode", "sticky_select" },
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
  stickyColorSelect = {
    description = "Sticky Color Mode",
    buttons = { "c" },
    modes = { "sticky_select" },
    call = function()
      modes.changeMode("color", true)
    end,
  },
  stickyShapeSelect = {
    description = "Sticky Shape Mode",
    buttons = { "s" },
    modes = { "sticky_select" },
    call = function()
      modes.changeMode("shape", true)
    end,
  },
  stickyPageSelect = {
    description = "Sticky Page Mode",
    buttons = { "q" },
    modes = { "sticky_select" },
    call = function()
      modes.changeMode("page", true)
    end,
  },
  stickyNavigationSelect = {
    description = "Sticky Navigation Mode",
    buttons = { "v" },
    modes = { "sticky_select" },
    call = function()
      modes.changeMode("navigation", true)
    end,
  },
  stickyFileSelect = {
    description = "Sticky File Mode",
    buttons = { "f" },
    modes = { "sticky_select" },
    call = function()
      modes.changeMode("file", true)
    end,
  },
  stickyEditSelect = {
    description = "Sticky Edit Mode",
    buttons = { "e" },
    modes = { "sticky_select" },
    call = function()
      modes.changeMode("edit", true)
    end,
  },
  stickyLayerSelect = {
    description = "Sticky Layer Mode",
    buttons = { "w" },
    modes = { "sticky_select" },
    call = function()
      modes.changeMode("layer", true)
    end,
  },
}
