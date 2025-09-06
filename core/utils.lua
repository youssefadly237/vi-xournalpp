local utils = {}

-- Color cycling state
local current_color_index = 1
local color_palette = nil

-- Linestyle cycling state
local current_linestyle_index = 1
local linestyles = {
  { name = "Plain", api_call = "ClickPlain" },
  { name = "Dashed", api_call = "ClickDashed" },
  { name = "Dash-Dotted", api_call = "ClickDashDotted" },
  { name = "Dotted", api_call = "ClickDotted" },
}

-- Helper function to clean all shape selections
function utils.cleanShape()
  local api = require("api.api")
  api.ClickRuler(false)
  api.ClickArrow(false)
  api.ClickRectangle(false)
  api.ClickEllipse(false)
  api.ClickSpline(false)
  api.ClickFill(false)
end

-- Function to refresh color palette (clears cache)
function utils.refreshColorPalette()
  color_palette = nil
end

-- Function to get color palette
function utils.getColorPalette()
  if not color_palette then
    local api = require("api.api")
    local ok = pcall(function()
      color_palette = api.GetColorPalette()
    end)
    if not ok or not color_palette or #color_palette == 0 then
      -- Fallback to static colors
      local colors = require("config.colors")
      color_palette = colors.static_colors
    end
  end
  return color_palette
end

-- Helper function to apply color and show feedback
local function applyColor(index, color_entry)
  local api = require("api.api")
  local color, name

  if color_entry.color then
    -- Both dynamic and static palette formats have .color field
    color = color_entry.color
    name = color_entry.name and ("[" .. index .. "] " .. color_entry.name) or ("Color " .. index)
  else
    -- Fallback for any other format
    color = color_entry[1] or 0x000000
    name = "Color " .. index
  end

  api.ChangeToolColor(color, name)
end

-- Function to set color by index
function utils.setColorByIndex(index)
  local palette = utils.getColorPalette()
  if palette and #palette > 0 and index >= 1 and index <= #palette then
    current_color_index = index
    applyColor(index, palette[index])
  end
end

-- Function to cycle to next color
function utils.nextColor()
  local palette = utils.getColorPalette()
  if palette and #palette > 0 then
    current_color_index = current_color_index + 1
    if current_color_index > #palette then
      current_color_index = 1
    end
    applyColor(current_color_index, palette[current_color_index])
  end
end

-- Function to cycle to previous color
function utils.previousColor()
  local palette = utils.getColorPalette()
  if palette and #palette > 0 then
    current_color_index = current_color_index - 1
    if current_color_index < 1 then
      current_color_index = #palette
    end
    applyColor(current_color_index, palette[current_color_index])
  end
end

-- Helper function to apply linestyle
local function applyLinestyle(index)
  local api = require("api.api")
  local linestyle = linestyles[index]
  if linestyle and api[linestyle.api_call] then
    api[linestyle.api_call]()
    print("Linestyle: " .. linestyle.name)
  end
end

-- Function to cycle through linestyles
function utils.cycleLinestyle()
  current_linestyle_index = current_linestyle_index + 1
  if current_linestyle_index > #linestyles then
    current_linestyle_index = 1
  end
  applyLinestyle(current_linestyle_index)
end

-- Function to set plain linestyle directly
function utils.setPlainLinestyle()
  current_linestyle_index = 1 -- Plain is always index 1
  applyLinestyle(1)
end

-- Helper function to merge tables
function utils.mergeTables(...)
  local result = {}
  for _, tbl in ipairs({ ... }) do
    for k, v in pairs(tbl) do
      result[k] = v
    end
  end
  return result
end

-- Helper function to generate shift key variants
function utils.generateShiftKeys(buttons)
  local shift_buttons = {}
  for _, btn in ipairs(buttons) do
    table.insert(shift_buttons, "<Shift>" .. btn)
  end
  return shift_buttons
end

return utils
