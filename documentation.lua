#!/usr/bin/env lua

-- Standalone script to generate keybindings documentation for vi-xournalpp
-- Usage: lua generate_keybindings_docs.lua [output_file]

local function generateKeybindingsDocs()
  -- For documentation purposes, we'll skip the dynamic color palette loading
  -- and just use static colors, since we're not running inside Xournal++

  -- Clear module cache to get fresh keybindings
  package.loaded["keybindings.init"] = nil
  package.loaded["keybindings.colors"] = nil

  local keybindings = require("keybindings.init")

  -- Separate global and mode-specific keybindings
  local global_bindings = {}
  local modes_map = {}

  for binding_name, binding in pairs(keybindings) do
    -- Check if this binding appears in multiple modes (likely global)
    local mode_count = #binding.modes
    local is_global = mode_count > 3 -- If it's in more than 3 modes, treat as global

    -- Special case for mode menu which should always be global
    if binding.description and binding.description:find("Mode Menu") then
      is_global = true
    end

    if is_global then
      -- Add to global bindings
      local entry = {
        name = binding_name,
        description = binding.description or binding_name,
        buttons = binding.buttons
      }
      table.insert(global_bindings, entry)
    else
      -- Add to mode-specific bindings
      for _, mode in ipairs(binding.modes) do
        if not modes_map[mode] then
          modes_map[mode] = {}
        end

        local entry = {
          name = binding_name,
          description = binding.description or binding_name,
          buttons = binding.buttons
        }

        table.insert(modes_map[mode], entry)
      end
    end
  end

  -- Sort modes for consistent output
  local sorted_modes = {}
  for mode in pairs(modes_map) do
    table.insert(sorted_modes, mode)
  end
  table.sort(sorted_modes)

  -- Generate markdown content
  local markdown = "# Key bindings\n\n"

  -- Add global bindings first
  if #global_bindings > 0 then
    markdown = markdown .. "## Global bindings\n\n"

    -- Sort global bindings by description
    table.sort(global_bindings, function(a, b)
      return a.description:lower() < b.description:lower()
    end)

    for _, binding in ipairs(global_bindings) do
      local button_str = table.concat(binding.buttons, ", ")
      button_str = "`" .. button_str:gsub(", ", "`, `") .. "`"
      markdown = markdown .. "* " .. binding.description .. ": " .. button_str .. "\n"
    end

    markdown = markdown .. "\n"
  end

  -- Add mode-specific bindings
  for _, mode in ipairs(sorted_modes) do
    markdown = markdown .. "## " .. mode .. " mode\n\n"

    -- Sort bindings within each mode by description
    local bindings = modes_map[mode]
    table.sort(bindings, function(a, b)
      return a.description:lower() < b.description:lower()
    end)

    for _, binding in ipairs(bindings) do
      -- Format buttons
      local button_str = table.concat(binding.buttons, ", ")
      -- Add backticks around buttons for markdown code formatting
      button_str = "`" .. button_str:gsub(", ", "`, `") .. "`"

      markdown = markdown .. "* " .. binding.description .. ": " .. button_str .. "\n"
    end

    markdown = markdown .. "\n"
  end

  return markdown
end

local function writeKeybindingsToFile(filepath)
  filepath = filepath or "keybindings.md"

  local markdown = generateKeybindingsDocs()

  local file = io.open(filepath, "w")
  if not file then
    error("Could not open file for writing: " .. filepath)
  end

  file:write(markdown)
  file:close()

  print("Documentation written to: " .. filepath)
  return true
end

local function main()
  local output_file = arg[1] or "keybindings.md"

  -- Check if we're in the right directory
  local file = io.open("plugin.ini", "r")
  if not file then
    print("Error: Must be run from the vi-xournalpp plugin directory")
    print("Make sure you're in the directory containing plugin.ini")
    os.exit(1)
  end
  file:close()

  print("Generating keybindings documentation...")

  local ok, err = pcall(function()
    writeKeybindingsToFile(output_file)
  end)

  if not ok then
    print("Error generating documentation:", err)
    os.exit(1)
  end

  print("Documentation successfully generated!")
end

-- Run if called directly
-- Run if called directly (accept filenames that include the word "generate"
-- so this file runs whether it's named generate_keybindings_docs.lua or
-- generate_docs.lua)
if arg and arg[0] and arg[0]:match("generate") then
  main()
end

-- Also provide as module
return {
  generateKeybindingsDocs = generateKeybindingsDocs,
  writeKeybindingsToFile = writeKeybindingsToFile
}
