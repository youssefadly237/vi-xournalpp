local api = require("api.api")

local utils = {}

local current_color_index = 1
local color_palette = nil
local last_known_color = nil

local current_linestyle_index = 1
local last_known_linestyle = nil
local linestyles = {
  { name = "Plain", api_call = "ClickPlain" },
  { name = "Dashed", api_call = "ClickDashed" },
  { name = "Dash-Dotted", api_call = "ClickDashDotted" },
  { name = "Dotted", api_call = "ClickDotted" },
}

local fill_enabled = false
local last_known_fill = nil

function utils.cleanShape()
  api.ClickRuler(false)
  api.ClickCoordinateSystem(false)
  api.ClickArrow(false)
  api.ClickDoubleArrow(false)
  api.ClickRectangle(false)
  api.ClickEllipse(false)
  api.ClickShapeRecognizer(false)
  api.ClickSpline(false)
  api.ClickFill(false)
  -- this may look a bit confusing, Protractor and Setsquare can not be active at the same time,
  -- it is called "Mutual Exclusivity" (just googled its name)
  -- so by calling on of them we have ensure that the other is not active, then on off the other
  -- so we guarantee both are turned off, it is not clean but can not think of something better rn
  api.ClickProtractor()
  api.ClickSetsquare()
  api.ClickSetsquare()
end

function utils.refreshColorPalette()
  color_palette = nil
end

function utils.getColorPalette()
  if not color_palette then
    local ok = pcall(function()
      color_palette = api.GetColorPalette()
    end)
    if not ok or not color_palette or #color_palette == 0 then
      local colors = require("config.colors")
      color_palette = colors.static_colors
    end
  end
  return color_palette
end

local function applyColor(index, color_entry)
  local color, name
  if color_entry.color then
    color = color_entry.color
    name = color_entry.name and ("[" .. index .. "] " .. color_entry.name) or ("Color " .. index)
  else
    color = color_entry[1] or 0x000000
    name = "Color " .. index
  end
  api.ChangeToolColor(color, name)
end

function utils.setColorByIndex(index)
  local palette = utils.getColorPalette()
  if palette and #palette > 0 and index >= 1 and index <= #palette then
    current_color_index = index
    applyColor(index, palette[index])
  end
end

function utils.nextColor()
  utils.syncColorWithApp()
  local palette = utils.getColorPalette()
  if palette and #palette > 0 then
    current_color_index = current_color_index + 1
    if current_color_index > #palette then
      current_color_index = 1
    end
    applyColor(current_color_index, palette[current_color_index])
  end
end

function utils.previousColor()
  utils.syncColorWithApp()
  local palette = utils.getColorPalette()
  if palette and #palette > 0 then
    current_color_index = current_color_index - 1
    if current_color_index < 1 then
      current_color_index = #palette
    end
    applyColor(current_color_index, palette[current_color_index])
  end
end

local function applyLinestyle(index)
  local linestyle = linestyles[index]
  if linestyle and api[linestyle.api_call] then
    api[linestyle.api_call]()
    print("Linestyle: " .. linestyle.name)
  end
end

function utils.cycleLinestyle()
  utils.syncLinestyleWithApp()
  current_linestyle_index = current_linestyle_index + 1
  if current_linestyle_index > #linestyles then
    current_linestyle_index = 1
  end
  applyLinestyle(current_linestyle_index)
end

function utils.setPlainLinestyle()
  current_linestyle_index = 1
  applyLinestyle(1)
end

function utils.toggleFill()
  utils.syncFillWithApp()
  fill_enabled = not fill_enabled
  local api = require("api.api")
  api.ClickFill(fill_enabled)
end

function utils.syncFillWithApp()
  if not app then
    return
  end
  local ok, toolInfo = pcall(function()
    return app.getToolInfo("active")
  end)
  if ok and toolInfo and toolInfo.fill ~= nil then
    local app_fill = toolInfo.fill
    if last_known_fill ~= app_fill then
      last_known_fill = app_fill
      fill_enabled = app_fill
    end
  end
end

function utils.syncColorWithApp()
  if not app then
    return
  end
  local ok, toolInfo = pcall(function()
    return app.getToolInfo("active")
  end)
  if ok and toolInfo and toolInfo.color then
    local app_color = toolInfo.color
    if last_known_color ~= app_color then
      last_known_color = app_color
      local palette = utils.getColorPalette()
      if palette then
        for i, color_entry in ipairs(palette) do
          if color_entry.color == app_color then
            current_color_index = i
            return
          end
        end
      end
      current_color_index = 1
    end
  end
end

function utils.syncLinestyleWithApp()
  if not app then
    return
  end
  local ok, toolInfo = pcall(function()
    return app.getToolInfo("active")
  end)
  if ok and toolInfo and toolInfo.lineStyle then
    local app_linestyle = toolInfo.lineStyle
    if last_known_linestyle ~= app_linestyle then
      last_known_linestyle = app_linestyle
      for i, linestyle in ipairs(linestyles) do
        local style_name = linestyle.name:lower()
        if
          (app_linestyle == "plain" and style_name == "plain")
          or (app_linestyle == "dash" and style_name == "dashed")
          or (app_linestyle == "dot" and style_name == "dotted")
          or (app_linestyle == "dashdot" and style_name == "dash-dotted")
        then
          current_linestyle_index = i
          return
        end
      end
      current_linestyle_index = 1
    end
  end
end

function utils.syncWithApp()
  utils.syncColorWithApp()
  utils.syncLinestyleWithApp()
  utils.syncFillWithApp()
end

function utils.mergeTables(...)
  local result = {}
  for _, tbl in ipairs({ ... }) do
    for k, v in pairs(tbl) do
      result[k] = v
    end
  end
  return result
end

function utils.generateShiftKeys(buttons)
  local shift_buttons = {}
  for _, btn in ipairs(buttons) do
    table.insert(shift_buttons, "<Shift>" .. btn)
  end
  return shift_buttons
end

return utils
