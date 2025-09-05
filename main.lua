---@diagnostic disable-next-line: lowercase-global
app = rawget(_G, "app")
if not app then
  error("host 'app' not found: run inside Xournal++")
end

-- Load modular components
local keybindings = require("keybindings.init")
local modes = require("core.modes")
local handler = require("core.handler")

-- Make modes globally accessible for backward compatibility
CurrentMode = modes.currentMode
LastPage = modes.lastPage
Sticky = modes.sticky

-- Make handler globally accessible BEFORE registering keybindings
Handle = handler.handle
HandlerModule = handler -- Also make the handler module globally accessible

---@diagnostic disable-next-line: lowercase-global
function initUi()
  -- Register placeholder only works in Xournal++ >= 1.2.8 (or 1.2.7+dev)
  if app.registerPlaceholder then
    app.registerPlaceholder("vi-mode", "Vi Mode Indicator")
  end

  -- Set initial placeholder value to show current mode
  local display = modes.getCurrentMode()
  -- Tool mode never shows "(sticky)" even though it's always sticky
  if modes.isSticky() and modes.getCurrentMode() ~= "tool" then
    display = display .. " (sticky)"
  end
  if app.setPlaceholderValue then
    app.setPlaceholderValue("vi-mode", display)
  end

  handler.registerKeybindings(keybindings)
end
