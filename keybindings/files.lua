local api = require("api.api")

return {
  -- File operations
  annotatePDF = {
    description = "Annotate PDF",
    buttons = { "a" },
    modes = { "file" },
    call = function()
      api.ClickAnnotatePDF()
    end,
  },
  exportAsPDF = {
    description = "Export as PDF",
    buttons = { "e" },
    modes = { "file" },
    call = function()
      api.ClickExportAsPDF()
    end,
  },
  exportAs = {
    description = "Export as",
    buttons = { "<Shift>e" },
    modes = { "file" },
    call = function()
      api.ClickExportAsPDF()
    end,
  },
  print = {
    description = "Print",
    buttons = { "d" },
    modes = { "file" },
    call = function()
      api.ClickExportAsPDF()
    end,
  },
  save = {
    description = "Save",
    buttons = { "s" },
    modes = { "file" },
    call = function()
      api.ClickSave()
    end,
  },
  saveAs = {
    description = "Save As",
    buttons = { "<Shift>s" },
    modes = { "file" },
    call = function()
      api.ClickSave()
    end,
  },
  new = {
    description = "New",
    buttons = { "w" },
    modes = { "file" },
    call = function()
      api.ClickNew()
    end,
  },
  open = {
    description = "Open",
    buttons = { "r" },
    modes = { "file" },
    call = function()
      api.ClickOpen()
    end,
  },
  quit = {
    description = "Quit",
    buttons = { "q" },
    modes = { "file" },
    call = function()
      api.ClickQuit()
    end,
  },
}
