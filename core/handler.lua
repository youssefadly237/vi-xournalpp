local handler = {}

-- Import the modes module
local modes = require("core.modes")

-- Flag to track if keybindings need refreshing
local keybindings_need_refresh = false

function handler.handle(key)
  if keybindings_need_refresh then
    package.loaded["keybindings.init"] = nil
    package.loaded["keybindings.colors"] = nil
    keybindings_need_refresh = false
  end

  local keybindings = require("keybindings.init")

  for _, binding in pairs(keybindings) do
    if
      handler.contains(binding.buttons, key)
      and handler.contains(binding.modes, modes.getCurrentMode())
    then
      if modes.getCurrentMode() ~= "tool" and not modes.isSticky() then
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
      break
    end
  end
end

function handler.requestKeybindingsRefresh()
  keybindings_need_refresh = true
end

function handler.contains(list, element)
  for _, item in ipairs(list) do
    if item == element then
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

        local success, err = pcall(function()
          app.registerUi({
            menu = "Vi-key: " .. button,
            callback = functionName,
            accelerator = button,
          })
        end)

        if not success then
          error("Failed to register key '" .. button .. "': " .. tostring(err))
        end

        registered_keys[button] = true
        index = index + 1
      end
    end
  end
end

return handler
