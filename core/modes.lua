local modes = {}

modes.currentMode = "tool"
modes.lastPage = 1
modes.sticky = false

modes.ALL_MODES = {
  "tool",
  "mode",
  "sticky_select",
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

  local display
  if mode == "mode" then
    display = "Mode Menu"
  elseif mode == "sticky_select" then
    display = "Sticky Menu"
  elseif modes.sticky and mode ~= "tool" then
    display = mode .. " (sticky)"
  else
    display = mode
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
