local api = require("api.api")
local utils = require("core.utils")
local colors = require("config.colors")
local static_colors = colors.static_colors

local color_buttons = {
  "q",
  "w",
  "e",
  "r",
  "a",
  "s",
  "d",
  "f",
  "z",
  "x",
  "c",
  "v",
}

local color_keybindings = {}

local function setupColorKeybindings()
  color_keybindings = {}
  local shift_color_buttons = utils.generateShiftKeys(color_buttons)
  local palette = utils.getColorPalette()

  if palette and #palette > 0 then
    for i = 1, math.min(#palette, #color_buttons + #shift_color_buttons) do
      local btn = i <= #color_buttons and color_buttons[i]
        or shift_color_buttons[i - #color_buttons]
      color_keybindings["color_" .. tostring(i)] = {
        buttons = { btn },
        modes = { "color" },
        call = function()
          utils.setColorByIndex(i)
        end,
      }
    end

    color_keybindings.refreshColors = {
      description = "Refresh color keybindings",
      buttons = { "<Ctrl>r" },
      modes = { "color" },
      call = function()
        utils.refreshColorPalette()
        setupColorKeybindings()
        if rawget(_G, "HandlerModule") and HandlerModule.requestColorsRefresh then
          HandlerModule.requestColorsRefresh()
          print("Color keybindings will be refreshed on next key press")
        else
          print("Color palette refreshed - restart Xournal++ for full effect")
        end
      end,
    }
  else
    if app then
      print("Using static color palette (dynamic palette unavailable)")
    end
    for i, entry in ipairs(static_colors) do
      color_keybindings[entry.name:lower()] = {
        description = entry.name,
        buttons = entry.buttons,
        modes = { "color" },
        call = function()
          utils.setColorByIndex(i)
        end,
      }
    end
  end
end

setupColorKeybindings()
return color_keybindings
