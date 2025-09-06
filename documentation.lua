#!/usr/bin/env lua

local function generateKeybindingsDocs()
  package.loaded["keybindings.init"] = nil
  package.loaded["keybindings.colors"] = nil

  local keybindings = require("keybindings.init")

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
    table.sort(global_bindings, function(a, b)
      return a.description:lower() < b.description:lower()
    end)

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
    table.sort(bindings, function(a, b)
      return a.description:lower() < b.description:lower()
    end)

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
