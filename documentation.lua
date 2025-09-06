#!/usr/bin/env lua

-- Custom sorting function based on keyboard layout order
local function getKeyboardOrder(button)
  -- Define the keyboard layout order: qwerasdfzxcvtgb, then modifiers, then others
  local layout_order = {
    ["q"] = 1,
    ["w"] = 2,
    ["e"] = 3,
    ["r"] = 4,
    ["a"] = 5,
    ["s"] = 6,
    ["d"] = 7,
    ["f"] = 8,
    ["z"] = 9,
    ["x"] = 10,
    ["c"] = 11,
    ["v"] = 12,
    ["t"] = 13,
    ["g"] = 14,
    ["b"] = 15,
  }

  -- Extract the base key (without modifiers)
  local base_key = button:lower()
  base_key = base_key:gsub("<[^>]*>", "") -- Remove modifier tags like <Shift>, <Ctrl>

  -- Get the order for the base key
  local order = layout_order[base_key]
  if order then
    -- If it's a shifted version, add 100 to maintain order but place after unmodified
    if button:find("<[Ss]hift>") then
      return order + 100
      -- If it's a ctrl version, add 200
    elseif button:find("<[Cc]trl>") then
      return order + 200
      -- If it's another modifier, add 300
    elseif button:find("<[^>]*>") then
      return order + 300
    else
      return order
    end
  else
    -- For keys not in our layout, put them at the end (1000+)
    return 1000 + string.byte(base_key:sub(1, 1) or "z")
  end
end

local function sortByKeyboardLayout(a, b)
  -- Get the first button for each binding for comparison
  local button_a = a.buttons[1] or ""
  local button_b = b.buttons[1] or ""

  local order_a = getKeyboardOrder(button_a)
  local order_b = getKeyboardOrder(button_b)

  if order_a == order_b then
    -- If same order, fall back to alphabetical by description
    return a.description:lower() < b.description:lower()
  end

  return order_a < order_b
end

local function generateKeybindingsDocs()
  package.loaded["keybindings.init"] = nil
  package.loaded["keybindings.colors"] = nil

  local keybindings = require("keybindings.init")

  -- Load static colors for documentation purposes
  local colors_config = require("config.colors")
  local static_colors = colors_config.static_colors

  local global_bindings = {}
  local modes_map = {}

  for binding_name, binding in pairs(keybindings) do
    local mode_count = #binding.modes
    local is_global = mode_count > 3
      or (binding.description and binding.description:find("Mode Menu"))

    if is_global then
      table.insert(global_bindings, {
        name = binding_name,
        description = binding.description or binding_name,
        buttons = binding.buttons,
      })
    else
      for _, mode in ipairs(binding.modes) do
        if not modes_map[mode] then
          modes_map[mode] = {}
        end
        table.insert(modes_map[mode], {
          name = binding_name,
          description = binding.description or binding_name,
          buttons = binding.buttons,
        })
      end
    end
  end

  local sorted_modes = {}
  for mode in pairs(modes_map) do
    table.insert(sorted_modes, mode)
  end
  table.sort(sorted_modes)

  local markdown = "# Key bindings\n\n"

  if #global_bindings > 0 then
    markdown = markdown .. "## Global bindings\n\n"
    table.sort(global_bindings, sortByKeyboardLayout)

    for _, binding in ipairs(global_bindings) do
      local button_str = "`" .. table.concat(binding.buttons, "`, `") .. "`"
      markdown = markdown .. "* " .. binding.description .. ": " .. button_str .. "\n"
    end
    if #sorted_modes > 0 then
      markdown = markdown .. "\n"
    end
  end

  for i, mode in ipairs(sorted_modes) do
    markdown = markdown .. "## " .. mode .. " mode\n\n"

    -- Add special note for color mode
    if mode == "color" then
      markdown = markdown
        .. "*Note: This shows the static color palette. In newer versions, colors are loaded dynamically from Xournal++'s current palette.*\n\n"
    end

    local bindings = modes_map[mode]

    -- Special handling for color mode: replace dynamic color bindings with static ones
    if mode == "color" then
      local color_bindings = {}

      -- Add static color bindings
      for _, static_entry in ipairs(static_colors) do
        table.insert(color_bindings, {
          name = static_entry.name:lower(),
          description = static_entry.name,
          buttons = static_entry.buttons,
        })
      end

      -- Add other non-color bindings (like refresh)
      for _, binding in ipairs(bindings) do
        if not binding.name:match("^color_") then
          table.insert(color_bindings, binding)
        end
      end

      bindings = color_bindings
    end

    table.sort(bindings, sortByKeyboardLayout)

    for _, binding in ipairs(bindings) do
      local button_str = "`" .. table.concat(binding.buttons, "`, `") .. "`"
      markdown = markdown .. "* " .. binding.description .. ": " .. button_str .. "\n"
    end
    if i ~= #sorted_modes then
      markdown = markdown .. "\n"
    end
  end

  return markdown
end

local function writeKeybindingsToFile()
  local markdown = generateKeybindingsDocs()
  local file = io.open("keybindings.md", "w")
  if not file then
    error("Could not open file for writing: keybindings.md")
  end
  file:write(markdown)
  file:close()
  print("Documentation written to: keybindings.md")
end

local function main()
  local file = io.open("plugin.ini", "r")
  if not file then
    print("Error: Must be run from the vi-xournalpp plugin directory")
    os.exit(1)
  end
  file:close()
  print("Generating keybindings documentation...")
  local ok, err = pcall(writeKeybindingsToFile)
  if not ok then
    print("Error generating documentation:", err)
    os.exit(1)
  end
  print("Documentation successfully generated!")
end

main()
