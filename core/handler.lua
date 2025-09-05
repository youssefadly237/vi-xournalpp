local handler = {}

-- Import the modes module
local modes = require("core.modes")

-- Flag to track if keybindings need refreshing
local keybindings_need_refresh = false

function handler.handle(key)
  -- Input validation
  if not key or type(key) ~= "string" or key == "" then
    print("Warning: Invalid key received:", tostring(key))
    return
  end

  -- Reload keybindings if refresh was requested
  if keybindings_need_refresh then
    package.loaded["keybindings.init"] = nil
    package.loaded["keybindings.colors"] = nil
    keybindings_need_refresh = false
  end

  local keybindings = require("keybindings.init")

  for _, binding in pairs(keybindings) do
    if handler.contains(binding.buttons, key) and handler.contains(binding.modes, modes.getCurrentMode()) then
      -- automatically return to tool mode from all other modes
      if modes.getCurrentMode() ~= "tool" and not modes.isSticky() then
        modes.changeMode("tool")
      end
      
      -- Execute binding with error handling
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

-- checks whether element is in list (slightly hacky)
function handler.contains(list, element)
  local set = {}
  for _, l in ipairs(list) do
    set[l] = true
  end
  return set[element]
end

function handler.registerKeybindings(keybindings)
  local index = 1
  local registered_keys = {} -- Track registered accelerators to avoid duplicates
  local button_to_modes = {} -- Track which modes use which buttons for better error messages

  -- First pass: collect all unique buttons and track their usage
  for bindingName, binding in pairs(keybindings) do
    for _, button in pairs(binding.buttons) do
      if not button_to_modes[button] then
        button_to_modes[button] = {}
      end
      for _, mode in pairs(binding.modes) do
        table.insert(button_to_modes[button], bindingName .. " (" .. mode .. " mode)")
      end
    end
  end

  -- Second pass: register each unique button only once
  for button, usages in pairs(button_to_modes) do
    -- Check if this button was already registered
    if registered_keys[button] then
      goto continue
    end

    -- Create a function in the global scope
    local functionName = "f" .. tostring(index)
    _G[functionName] = function()
      Handle(button)
    end

    -- Try to register with Xournal++ and fail if it doesn't work
    local success, err = pcall(function()
      app.registerUi({
        ["menu"] = "Vi-key: " .. button .. " (used by: " .. table.concat(usages, ", ") .. ")",
        ["callback"] = functionName,
        ["accelerator"] = button,
      })
    end)

    if not success then
      error("FAILED TO REGISTER KEYBINDING: Button '" ..
        button .. "' used by: " .. table.concat(usages, ", ") .. ". Error: " .. tostring(err))
    end

    registered_keys[button] = true
    index = index + 1
    ::continue::
  end
end

return handler
