#!/usr/bin/env lua

-- Keybinding conflict detection module
local validator = {}

function validator.validateKeybindings()
  -- Clear module cache
  package.loaded["keybindings.init"] = nil
  package.loaded["keybindings.colors"] = nil

  local keybindings = require("keybindings.init")
  local conflicts = {}
  local mode_key_map = {} -- mode -> key -> [binding_names]

  -- Build a map of mode+key combinations
  for binding_name, binding in pairs(keybindings) do
    for _, mode in ipairs(binding.modes) do
      for _, button in ipairs(binding.buttons) do
        local key = mode .. ":" .. button

        if not mode_key_map[key] then
          mode_key_map[key] = {}
        end

        table.insert(mode_key_map[key], binding_name)
      end
    end
  end

  -- Check for conflicts
  for key, bindings in pairs(mode_key_map) do
    if #bindings > 1 then
      local mode, button = key:match("([^:]+):(.+)")
      table.insert(conflicts, {
        mode = mode,
        button = button,
        bindings = bindings,
      })
    end
  end

  return conflicts
end

function validator.printConflicts(conflicts)
  if #conflicts > 0 then
    print("❌ KEYBINDING CONFLICTS DETECTED:")
    print()

    for _, conflict in ipairs(conflicts) do
      print("🔴 Conflict in mode '" .. conflict.mode .. "' for key '" .. conflict.button .. "':")
      for _, binding in ipairs(conflict.bindings) do
        print("   - " .. binding)
      end
      print()
    end

    print("Please resolve these conflicts before committing.")
    return false
  else
    print("✅ No keybinding conflicts detected.")
    return true
  end
end

-- If run directly, perform validation and exit
if arg and arg[0] and arg[0]:match("validate_keybindings") then
  local conflicts = validator.validateKeybindings()
  local success = validator.printConflicts(conflicts)
  if not success then
    os.exit(1)
  end
end

return validator
