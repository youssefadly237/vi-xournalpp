#!/usr/bin/env lua

-- Keybinding conflict detection module
local validator = {}

function validator.validateKeybindings()
  -- Clear module cache
  package.loaded["keybindings.init"] = nil
  package.loaded["keybindings.colors"] = nil

  local keybindings = require("keybindings.init")
  local modes = require("core.modes")
  local conflicts = {}
  local invalid_modes = {}
  local mode_key_map = {} -- mode -> key -> [binding_names]

  -- Build a map of mode+key combinations and check for invalid modes
  for binding_name, binding in pairs(keybindings) do
    for _, mode in ipairs(binding.modes) do
      -- Check if mode is valid
      local is_valid_mode = false
      for _, valid_mode in ipairs(modes.ALL_MODES) do
        if valid_mode == mode then
          is_valid_mode = true
          break
        end
      end

      if not is_valid_mode then
        table.insert(invalid_modes, {
          binding = binding_name,
          mode = mode,
        })
      end

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

  return conflicts, invalid_modes
end

function validator.printConflicts(conflicts, invalid_modes)
  local has_issues = false

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
    has_issues = true
  end

  if invalid_modes and #invalid_modes > 0 then
    print("❌ INVALID MODES DETECTED:")
    print()

    for _, invalid in ipairs(invalid_modes) do
      print("🔴 Binding '" .. invalid.binding .. "' uses invalid mode '" .. invalid.mode .. "'")
    end
    print()

    local modes = require("core.modes")
    print("Valid modes: " .. table.concat(modes.ALL_MODES, ", "))
    print()
    has_issues = true
  end

  if has_issues then
    print("Please resolve these issues before committing.")
    return false
  else
    print("✅ No keybinding conflicts or invalid modes detected.")
    return true
  end
end

-- If run directly, perform validation and exit
if arg and arg[0] and arg[0]:match("validate_keybindings") then
  local conflicts, invalid_modes = validator.validateKeybindings()
  local success = validator.printConflicts(conflicts, invalid_modes)
  if not success then
    os.exit(1)
  end
end

return validator
