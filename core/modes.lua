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
  "linestyle",
  "page",
  "file",
  "navigation",
  "visual",
  "resize",
}

function modes.changeMode(mode, stickyValue)
  -- Validate mode parameter
  if not mode or type(mode) ~= "string" then
    print("Error: Invalid mode parameter:", tostring(mode))
    return false
  end

  -- Check if mode is valid
  local isValidMode = false
  for _, validMode in ipairs(modes.ALL_MODES) do
    if validMode == mode then
      isValidMode = true
      break
    end
  end

  if not isValidMode then
    print(
      "Warning: Unknown mode '" .. mode .. "'. Valid modes:",
      table.concat(modes.ALL_MODES, ", ")
    )
    return false
  end

  modes.currentMode = mode
  if stickyValue ~= nil then
    modes.sticky = stickyValue
  end
  local display = modes.currentMode
  -- Tool mode never shows "(sticky)" even though it's always sticky
  if modes.sticky and modes.currentMode ~= "tool" then
    display = display .. " (sticky)"
  end
  -- Update placeholder if available
  if app and app.setPlaceholderValue then
    app.setPlaceholderValue("vi-mode", display)
  end

  return true
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
