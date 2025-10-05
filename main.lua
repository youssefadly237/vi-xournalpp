-- Load modular components
local keybindings = require("keybindings.init")
local modes = require("core.modes")
local handler = require("core.handler")
local validator = require("validate_keybindings")

CurrentMode = modes.currentMode
LastPage = modes.lastPage
Sticky = modes.sticky

Handle = handler.handle
HandlerModule = handler

---@diagnostic disable-next-line: lowercase-global
function initUi()
  local conflicts, invalid_modes = validator.validateKeybindings()

  if #conflicts > 0 or (invalid_modes and #invalid_modes > 0) then
    print("⚠️  VALIDATION ISSUES DETECTED:")

    if #conflicts > 0 then
      for _, conflict in ipairs(conflicts) do
        print(
          "🔴 Mode '"
            .. conflict.mode
            .. "' key '"
            .. conflict.button
            .. "': "
            .. table.concat(conflict.bindings, ", ")
        )
      end
    end

    if invalid_modes and #invalid_modes > 0 then
      for _, invalid in ipairs(invalid_modes) do
        print("🔴 Invalid mode '" .. invalid.mode .. "' in binding '" .. invalid.binding .. "'")
      end
    end

    print("Plugin may not work correctly!")
  end
  if app.registerPlaceholder then
    app.registerPlaceholder("vi-mode", "Vi Mode Indicator")
  end

  local display = modes.getCurrentMode()
  if modes.isSticky() and modes.getCurrentMode() ~= "tool" then
    display = display .. " (sticky)"
  end
  if app.setPlaceholderValue then
    app.setPlaceholderValue("vi-mode", display)
  end

  handler.registerKeybindings(keybindings)
end
