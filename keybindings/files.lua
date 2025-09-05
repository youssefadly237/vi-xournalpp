local api = require("api.api")

return {
  -- File operations
  annotatePDF = {
    description = "Annotate PDF",
    buttons = { "a" },
    modes = { "file" },
    call = function()
      api.clickAnnotatePDF()
    end,
  },
  exportAsPDF = {
    description = "Export as PDF",
    buttons = { "e" },
    modes = { "file" },
    call = function()
      api.clickExportAsPDF()
    end,
  },
  save = {
    description = "Save",
    buttons = { "s" },
    modes = { "file" },
    call = function()
      api.clickSave()
    end,
  },
  saveAs = {
    description = "Save As",
    buttons = { "<Shift>s" },
    modes = { "file" },
    call = function()
      api.clickSave()
    end,
  },
  open = {
    description = "Open",
    buttons = { "o" },
    modes = { "file" },
    call = function()
      api.clickOpen()
    end,
  },
}
