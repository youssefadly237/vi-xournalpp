local api = require("api.api")
local colors = require("config.colors")
local static_colors = colors.static_colors

-- Color button grid layout (QWERTY left hand)
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

local shift_color_buttons = {}
local color_keybindings = {}

-- Generate color keybindings
local function setupColorKeybindings()
  -- Clear existing color keybindings
  color_keybindings = {}

  -- Generate shift keys for current layout
  shift_color_buttons = {}
  for _, btn in ipairs(color_buttons) do
    table.insert(shift_color_buttons, "<Shift>" .. btn)
  end

  local palette = nil
  local ok = pcall(function()
    palette = api.getColorPalette()
  end)

  if ok and type(palette) == "table" and #palette > 0 then
    -- Successfully got dynamic color palette
    for i = 1, math.min(#palette, #color_buttons + #shift_color_buttons) do
      local btn = i <= #color_buttons and color_buttons[i] or shift_color_buttons[i - #color_buttons]
      color_keybindings["color_" .. tostring(i)] = {
        description = "Color " .. tostring(i) .. " (" .. palette[i].name .. ")",
        buttons = { btn },
        modes = { "color" },
        call = function()
          api.changeToolColor(palette[i].color)
        end,
      }
    end

    -- Map <Ctrl>r to refresh color keybindings
    color_keybindings.refreshColors = {
      description = "Refresh color keybindings",
      buttons = { "<Ctrl>r" },
      modes = { "color" },
      call = function()
        setupColorKeybindings()
        -- Request keybindings refresh from handler
        if rawget(_G, "HandlerModule") and HandlerModule.requestKeybindingsRefresh then
          HandlerModule.requestKeybindingsRefresh()
          print("Color keybindings will be refreshed on next key press")
        else
          print("Color palette refreshed - restart Xournal++ for full effect")
        end
      end,
    }
  else
    -- Fall back to static colors
    print("Using static color palette (dynamic palette unavailable)")
    for i, entry in ipairs(static_colors) do
      color_keybindings[entry.name:lower()] = {
        description = entry.name,
        buttons = entry.buttons,
        modes = { "color" },
        call = function()
          api.changeToolColor(entry.color)
        end,
      }
    end
  end
end

-- Initialize color keybindings
setupColorKeybindings()

return color_keybindings
