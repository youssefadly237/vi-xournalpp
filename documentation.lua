#!/usr/bin/env lua

-- Generate keyboard visualization for a mode
local function generateKeyboardForMode(mode, bindings, output_dir)
  local mappings = {}
  for _, binding in ipairs(bindings) do
    for _, button in ipairs(binding.buttons) do
      mappings[button] = binding.description
    end
  end

  local temp_file = "/tmp/generate_keyboard_" .. mode .. ".py"
  local file = io.open(temp_file, "w")
  if not file then
    print("Warning: Could not create temporary file for keyboard generation")
    return false
  end

  -- Generate Python script
  file:write("import sys\nsys.path.insert(0, '.')\n")
  file:write("try:\n    from keyboardviz import generate_keyboard\nexcept ImportError:\n")
  file:write("    print('Warning: Could not access keyboardviz module')\n    sys.exit(1)\n")
  file:write("import os\n\nmappings = {}\n")

  for key, desc in pairs(mappings) do
    file:write(
      string.format('mappings["%s"] = "%s"\n', key:gsub('"', '\\"'), desc:gsub('"', '\\"'))
    )
  end

  file:write(string.format(
    [[
os.makedirs("%s", exist_ok=True)
generate_keyboard(mappings, title="%s Mode", export_svg="%s/%s_keyboard.svg")
print("Generated keyboard for %s mode")
]],
    output_dir,
    mode:gsub("^%l", string.upper),
    output_dir,
    mode,
    mode
  ))

  file:close()

  local result = os.execute("python " .. temp_file .. " 2>/dev/null")
  os.remove(temp_file)
  return result == 0
end

-- QWERTY keyboard layout order (primary sort key)
local LAYOUT_ORDER = {
  q = 1,
  w = 2,
  e = 3,
  r = 4,
  a = 5,
  s = 6,
  d = 7,
  f = 8,
  z = 9,
  x = 10,
  c = 11,
  v = 12,
  t = 13,
  g = 14,
  b = 15,
}

-- Modifier priority (secondary sort - keeps modifiers near base key)
local MODIFIER_OFFSET = {
  none = 0.0, -- Plain key (e.g., "r")
  ctrl = 0.1, -- Ctrl modifier (e.g., "<Ctrl>r")
  shift = 0.2, -- Shift modifier (e.g., "<Shift>r")
  other = 0.3, -- Other modifiers
}

local function getKeyboardOrder(button)
  local base_key = button:lower():gsub("<[^>]*>", "")
  local base_order = LAYOUT_ORDER[base_key] or (1000 + string.byte(base_key:sub(1, 1) or "z"))

  local modifier_offset
  if button:find("<[Cc]trl>") then
    modifier_offset = MODIFIER_OFFSET.ctrl
  elseif button:find("<[Ss]hift>") then
    modifier_offset = MODIFIER_OFFSET.shift
  elseif button:find("<[^>]*>") then
    modifier_offset = MODIFIER_OFFSET.other
  else
    modifier_offset = MODIFIER_OFFSET.none
  end

  return base_order + modifier_offset
end

local function sortByKeyboardLayout(a, b)
  local order_a = getKeyboardOrder(a.buttons[1] or "")
  local order_b = getKeyboardOrder(b.buttons[1] or "")

  if order_a ~= order_b then
    return order_a < order_b
  end

  -- Same keyboard order, sort alphabetically by description
  return a.description:lower() < b.description:lower()
end

local function generateKeybindingsDocs()
  package.loaded["keybindings.init"] = nil
  package.loaded["keybindings.colors"] = nil

  local keybindings = require("keybindings.init")
  local colors_config = require("config.colors")
  local static_colors = colors_config.static_colors

  local global_bindings, modes_map = {}, {}

  -- Categorize bindings
  for binding_name, binding in pairs(keybindings) do
    local is_global = #binding.modes > 3
      or (binding.description and binding.description:find("Mode Menu"))
    local entry = {
      name = binding_name,
      description = binding.description or binding_name,
      buttons = binding.buttons,
    }

    if is_global then
      table.insert(global_bindings, entry)
    else
      for _, mode in ipairs(binding.modes) do
        modes_map[mode] = modes_map[mode] or {}
        table.insert(modes_map[mode], entry)
      end
    end
  end

  -- Generate markdown
  local markdown = "# Key bindings\n\n"

  if #global_bindings > 0 then
    markdown = markdown
      .. "## Global bindings\n\n![Global Mode Keyboard](docs/keyboards/global_keyboard.svg)\n\n"
    table.sort(global_bindings, sortByKeyboardLayout)
    for _, binding in ipairs(global_bindings) do
      markdown = markdown
        .. "* "
        .. binding.description
        .. ": `"
        .. table.concat(binding.buttons, "`, `")
        .. "`\n"
    end
    markdown = markdown .. "\n"
  end

  local sorted_modes = {}
  for mode in pairs(modes_map) do
    table.insert(sorted_modes, mode)
  end
  table.sort(sorted_modes)

  for i, mode in ipairs(sorted_modes) do
    markdown = markdown .. "## " .. mode .. " mode\n\n"
    markdown = markdown
      .. "!["
      .. mode:gsub("^%l", string.upper)
      .. " Mode Keyboard](docs/keyboards/"
      .. mode
      .. "_keyboard.svg)\n\n"

    if mode == "color" then
      markdown = markdown
        .. "*Note: This shows the static color palette. In newer versions, colors are loaded dynamically from Xournal++'s current palette.*\n\n"
    end

    local bindings = modes_map[mode]

    -- Handle color mode special case
    if mode == "color" then
      local color_bindings = {}
      for _, static_entry in ipairs(static_colors) do
        table.insert(color_bindings, {
          name = static_entry.name:lower(),
          description = static_entry.name,
          buttons = static_entry.buttons,
        })
      end
      for _, binding in ipairs(bindings) do
        if not binding.name:match("^color_") then
          table.insert(color_bindings, binding)
        end
      end
      bindings = color_bindings
    end

    table.sort(bindings, sortByKeyboardLayout)
    for _, binding in ipairs(bindings) do
      markdown = markdown
        .. "* "
        .. binding.description
        .. ": `"
        .. table.concat(binding.buttons, "`, `")
        .. "`\n"
    end
    if i ~= #sorted_modes then
      markdown = markdown .. "\n"
    end
  end

  return markdown
end

-- Generate keyboard visualizations for all modes
local function generateKeyboardVisualizations()
  package.loaded["keybindings.init"] = nil
  package.loaded["keybindings.colors"] = nil

  local keybindings = require("keybindings.init")
  local colors_config = require("config.colors")
  local static_colors = colors_config.static_colors
  local output_dir = "docs/keyboards"

  local global_bindings, modes_map = {}, {}

  -- Categorize bindings
  for binding_name, binding in pairs(keybindings) do
    local is_global = #binding.modes > 3
      or (binding.description and binding.description:find("Mode Menu"))
    local entry = {
      name = binding_name,
      description = binding.description or binding_name,
      buttons = binding.buttons,
    }

    if is_global then
      table.insert(global_bindings, entry)
    else
      for _, mode in ipairs(binding.modes) do
        modes_map[mode] = modes_map[mode] or {}
        table.insert(modes_map[mode], entry)
      end
    end
  end

  -- Generate keyboards
  if #global_bindings > 0 then
    generateKeyboardForMode("global", global_bindings, output_dir)
  end

  for mode, bindings in pairs(modes_map) do
    -- Handle color mode special case
    if mode == "color" then
      local color_bindings = {}
      for _, static_entry in ipairs(static_colors) do
        table.insert(color_bindings, {
          name = static_entry.name:lower(),
          description = static_entry.name,
          buttons = static_entry.buttons,
        })
      end
      for _, binding in ipairs(bindings) do
        if not binding.name:match("^color_") then
          table.insert(color_bindings, binding)
        end
      end
      bindings = color_bindings
    end
    generateKeyboardForMode(mode, bindings, output_dir)
  end
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
  print("Starting keyboard visualization generation...")
  generateKeyboardVisualizations()
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
