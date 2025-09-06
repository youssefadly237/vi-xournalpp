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
  open = {
    description = "Open",
    buttons = { "o" },
    modes = { "file" },
    call = function()
      api.ClickOpen()
    end,
  },
}
