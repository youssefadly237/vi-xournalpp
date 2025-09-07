local utils = require("core.utils")

-- Import all keybinding modules
local tools = require("keybindings.tools")
local shapes = require("keybindings.shapes")
local navigation = require("keybindings.navigation")
local pages = require("keybindings.pages")
local files = require("keybindings.files")
local edit = require("keybindings.edit")
local mode_switching = require("keybindings.mode_switching")
local colors = require("keybindings.colors")

-- Merge all keybinding tables
local keybindings =
  utils.mergeTables(tools, shapes, navigation, pages, files, edit, mode_switching, colors)

return keybindings
