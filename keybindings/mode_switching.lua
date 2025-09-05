local modes = require("core.modes")

return {
  -- Mode Selection Menu - Ctrl+Space for left hand accessibility
  modeMenu = {
    description = "Mode Menu",
    buttons = { "<Ctrl>space" },
    modes = { "tool", "color", "shape", "linestyle", "page", "file", "navigation", "visual", "resize" },
    call = function()
      modes.changeMode("mode", false)
    end,
  },

  -- From mode menu, select actual modes
  tool = {
    description = "Tool Mode (Always Sticky)",
    buttons = { "t" },
    modes = { "mode" },
    call = function()
      modes.changeMode("tool", true) -- Always sticky
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
  linestyle = {
    description = "Line Style Mode",
    buttons = { "h" },
    modes = { "mode" },
    call = function()
      modes.changeMode("linestyle", false)
    end,
  },
  page = {
    description = "Page Mode",
    buttons = { "p" },
    modes = { "mode" },
    call = function()
      modes.changeMode("page", false)
    end,
  },
  navigation = {
    description = "Navigation Mode",
    buttons = { "n" },
    modes = { "mode" },
    call = function()
      modes.changeMode("navigation", false)
    end,
  },
  file = {
    description = "File Mode",
    buttons = { "i" },
    modes = { "mode" },
    call = function()
      modes.changeMode("file", false)
    end,
  },
  visual = {
    description = "Visual Mode",
    buttons = { "v" },
    modes = { "mode" },
    call = function()
      modes.changeMode("visual", false)
    end,
  },
  resize = {
    description = "Resize Mode",
    buttons = { "r" },
    modes = { "mode" },
    call = function()
      modes.changeMode("resize", false)
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
  stickyLinestyle = {
    description = "Sticky Line Style Mode",
    buttons = { "<Shift>h" },
    modes = { "mode" },
    call = function()
      modes.changeMode("linestyle", true)
    end,
  },
  stickyPage = {
    description = "Sticky Page Mode",
    buttons = { "<Shift>p" },
    modes = { "mode" },
    call = function()
      modes.changeMode("page", true)
    end,
  },
  stickyNavigation = {
    description = "Sticky Navigation Mode",
    buttons = { "<Shift>n" },
    modes = { "mode" },
    call = function()
      modes.changeMode("navigation", true)
    end,
  },
  stickyFile = {
    description = "Sticky File Mode",
    buttons = { "<Shift>i" },
    modes = { "mode" },
    call = function()
      modes.changeMode("file", true)
    end,
  },
  stickyVisual = {
    description = "Sticky Visual Mode",
    buttons = { "<Shift>v" },
    modes = { "mode" },
    call = function()
      modes.changeMode("visual", true)
    end,
  },
  stickyResize = {
    description = "Sticky Resize Mode",
    buttons = { "<Shift>r" },
    modes = { "mode" },
    call = function()
      modes.changeMode("resize", true)
    end,
  },
}
