local api = require("api.api")

return {
  -- File operations
  annotatePDF = {
    description = "Annotate PDF",
    buttons = { "a" },
    modes = { "file" },
    call = api.ClickAnnotatePDF,
  },
  exportAsPDF = {
    description = "Export as PDF",
    buttons = { "e" },
    modes = { "file" },
    call = api.ClickExportAsPDF,
  },
  exportAs = {
    description = "Export as",
    buttons = { "<Shift>e" },
    modes = { "file" },
    call = api.ClickExportAsPDF,
  },
  print = {
    description = "Print",
    buttons = { "d" },
    modes = { "file" },
    call = api.ClickExportAsPDF,
  },
  save = {
    description = "Save",
    buttons = { "s" },
    modes = { "file" },
    call = api.ClickSave,
  },
  saveAs = {
    description = "Save As",
    buttons = { "<Shift>s" },
    modes = { "file" },
    call = api.ClickSave,
  },
  new = {
    description = "New",
    buttons = { "w" },
    modes = { "file" },
    call = api.ClickNew,
  },
  open = {
    description = "Open",
    buttons = { "r" },
    modes = { "file" },
    call = api.ClickOpen,
  },
  quit = {
    description = "Quit",
    buttons = { "q" },
    modes = { "file" },
    call = api.ClickQuit,
  },
}
