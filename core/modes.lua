local modes = {}

-- Global state
modes.currentMode = "tool"
modes.lastPage = 1
modes.sticky = false

-- All available modes
modes.ALL_MODES = {
  "tool",
  "mode",
  "color",
  "shape",
  "edit",
  "page",
  "file",
  "navigation",
  "layer",
}

function modes.changeMode(mode, stickyValue)
  modes.currentMode = mode
  if stickyValue ~= nil then
    modes.sticky = stickyValue
  end

  local display = modes.currentMode
  if modes.sticky and modes.currentMode ~= "tool" then
    display = display .. " (sticky)"
  end

  if app and app.setPlaceholderValue then
    app.setPlaceholderValue("vi-mode", display)
  end
end

function modes.getCurrentMode()
  return modes.currentMode
end

function modes.isSticky()
  return modes.sticky
end

function modes.setSticky(value)
  modes.sticky = value
end

return modes
