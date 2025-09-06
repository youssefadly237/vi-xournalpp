local handler = {}

local modes = require("core.modes")

local keybindings_cache = nil
local colors_need_refresh = false

function handler.handle(key)
  if colors_need_refresh then
    package.loaded["keybindings.colors"] = nil
    keybindings_cache = nil
    colors_need_refresh = false
  end

  if not keybindings_cache then
    keybindings_cache = require("keybindings.init")
  end

  local current_mode = modes.getCurrentMode()

  for _, binding in pairs(keybindings_cache) do
    if
      handler.keyMatches(binding.buttons, key) and handler.modeMatches(binding.modes, current_mode)
    then
      if current_mode ~= "tool" and not modes.isSticky() then
        modes.changeMode("tool")
      end

      local success, err = pcall(binding.call)
      if not success then
        print("Error executing keybinding:", err)
        return
      end

      if binding.description then
        print(binding.description)
      end
      return
    end
  end
end

function handler.requestColorsRefresh()
  colors_need_refresh = true
end

function handler.keyMatches(button_list, key)
  for _, button in ipairs(button_list) do
    if button == key then
      return true
    end
  end
  return false
end

function handler.modeMatches(mode_list, current_mode)
  for _, mode in ipairs(mode_list) do
    if mode == current_mode then
      return true
    end
  end
  return false
end

function handler.registerKeybindings(keybindings)
  local index = 1
  local registered_keys = {}

  for _, binding in pairs(keybindings) do
    for _, button in pairs(binding.buttons) do
      if not registered_keys[button] then
        local functionName = "viKey" .. index
        _G[functionName] = function()
          Handle(button)
        end

        app.registerUi({
          menu = "Vi-key: " .. button,
          callback = functionName,
          accelerator = button,
        })

        registered_keys[button] = true
        index = index + 1
      end
    end
  end
end

return handler
