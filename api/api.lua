-- src/core/plugin/ActionBackwardCompatibilityLayer.cpp --> xournalpp/xournalpp

-- line width
function ClickVeryFine()
  app.uiAction({ ["action"] = "ACTION_SIZE_VERY_FINE" })
end

function ClickFine()
  app.uiAction({ ["action"] = "ACTION_SIZE_FINE" })
end

function ClickMedium()
  app.uiAction({ ["action"] = "ACTION_SIZE_MEDIUM" })
end

function ClickThick()
  app.uiAction({ ["action"] = "ACTION_SIZE_THICK" })
end

function ClickVeryThick()
  app.uiAction({ ["action"] = "ACTION_SIZE_VERY_THICK" })
end

-- tools
function ClickPen()
  app.uiAction({ ["action"] = "ACTION_TOOL_PEN" })
end

-- tools
function ClickLaserPen()
  app.uiAction({ ["action"] = "ACTION_TOOL_PEN" })
end

function ClickEraser()
  app.uiAction({ ["action"] = "ACTION_TOOL_ERASER" })
end

function ClickHighlighter()
  app.uiAction({ ["action"] = "ACTION_TOOL_HIGHLIGHTER" })
end

function ClickSelectRegion()
  app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_REGION" })
end

function ClickSelectRectangle()
  app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_RECT" })
end

function ClickSelectObject()
  app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_OBJECT" })
end

function ClickTex()
  app.uiAction({ ["action"] = "ACTION_TEX" })
end

function ClickText()
  app.uiAction({ ["action"] = "ACTION_TOOL_TEXT" })
end

function ClickHand()
  app.uiAction({ ["action"] = "ACTION_TOOL_HAND" })
end

function ClickDelete()
  app.uiAction({ ["action"] = "ACTION_DELETE" })
end

function GetToolInfo(tool)
  return app.getToolInfo(tool)
end

-- shapes
function ClickRuler(enabled)
  app.uiAction({ ["action"] = "ACTION_RULER", ["enabled"] = enabled })
end

function ClickArrow(enabled)
  app.uiAction({ ["action"] = "ACTION_TOOL_DRAW_ARROW", ["enabled"] = enabled })
end

function ClickEllipse(enabled)
  app.uiAction({ ["action"] = "ACTION_TOOL_DRAW_ELLIPSE", ["enabled"] = enabled })
end

function ClickRectangle(enabled)
  app.uiAction({ ["action"] = "ACTION_TOOL_DRAW_RECT", ["enabled"] = enabled })
end

function ClickSpline(enabled)
  app.uiAction({ ["action"] = "ACTION_TOOL_DRAW_SPLINE", ["enabled"] = enabled })
end

function ClickPlain()
  app.uiAction({ ["action"] = "ACTION_TOOL_LINE_STYLE_PLAIN" })
end

function ClickFill(enabled)
  app.uiAction({ ["action"] = "ACTION_TOOL_FILL", ["selection"] = true, ["enabled"] = enabled })
end

-- linestyle
function ClickDotted()
  app.uiAction({ ["action"] = "ACTION_TOOL_LINE_STYLE_DOT" })
end

function ClickDashed()
  app.uiAction({ ["action"] = "ACTION_TOOL_LINE_STYLE_DASH" })
end

function ClickDashDotted()
  app.uiAction({ ["action"] = "ACTION_TOOL_LINE_STYLE_DASH_DOT" })
end

-- color
function GetColorPalette()
  local palette = app.getColorPalette()
  return palette
end

function ChangeToolColor(color, colorName)
  local activeToolInfo = GetToolInfo("active")
  local toolName = (activeToolInfo and activeToolInfo["type"]) or "unknown tool"

  local ok = pcall(function()
    app.changeToolColor({ color = color, selection = true })
  end)

  if ok then
    if colorName then
      print("Color: " .. colorName)
    end
  else
    print(toolName .. " does not support color")
  end
end

-- zooming
function ClickZoomIn()
  app.uiAction({ ["action"] = "ACTION_ZOOM_IN" })
end

function ClickZoomOut()
  app.uiAction({ ["action"] = "ACTION_ZOOM_OUT" })
end

-- page
function ClickCopyPage()
  app.sidebarAction("COPY")
end

function ClickDeletePage()
  app.uiAction({ ["action"] = "ACTION_DELETE_PAGE" })
end

function ClickMoveUp()
  app.sidebarAction("MOVE_UP")
end

function ClickMoveDown()
  app.sidebarAction("MOVE_DOWN")
end

function ClickNewBefore()
  app.sidebarAction("NEW_BEFORE")
end

function ClickNewAfter()
  app.sidebarAction("NEW_AFTER")
end

function ClickNewLayer()
  app.uiAction({ ["action"] = "ACTION_NEW_LAYER" })
end

function ClickDeleteLayer()
  app.uiAction({ ["action"] = "ACTION_DELETE_LAYER" })
end

-- navigation
function ClickGoToFirstPage()
  app.scrollToPage(1)
end

function ClickGoToTop()
  app.scrollToPos(0, 0, false)
end

function GoToPage(page)
  app.scrollToPage(page)
end

function GoToPos(x, y)
  app.scrollToPos(x, y)
end

function ClickScrollPageDown()
  app.scrollToPage(1, true)
end

function ClickScrollPageUp()
  app.scrollToPage(-1, true)
end

function ClickGoToBottom()
  local docStructure = app.getDocumentStructure()
  local currentPage = docStructure["currentPage"]
  local pageHeight = app.getDocumentStructure()["pages"][currentPage]["pageHeight"]
  app.scrollToPos(0, pageHeight, false)
end

function ClickGoToLastPage()
  -- it gets clamped in applib_scrollToPage anyway.
  app.scrollToPage(1000000000)
end

function CurrentPage()
  return app.getDocumentStructure()["currentPage"]
end

function ClickLayerDown()
  app.uiAction({ ["action"] = "ACTION_GOTO_PREVIOUS_LAYER" })
end

function ClickLayerUp()
  app.uiAction({ ["action"] = "ACTION_GOTO_NEXT_LAYER" })
end

-- history
function ClickUndo()
  app.uiAction({ ["action"] = "ACTION_UNDO" })
end

function ClickRedo()
  app.uiAction({ ["action"] = "ACTION_REDO" })
end

-- files
function ClickAnnotatePDF()
  app.uiAction({ ["action"] = "ACTION_ANNOTATE_PDF" })
end

function ClickExportAsPDF()
  app.uiAction({ ["action"] = "ACTION_EXPORT_AS_PDF" })
end

function ClickSave()
  app.uiAction({ ["action"] = "ACTION_SAVE" })
end

function ClickSaveAs()
  app.uiAction({ ["action"] = "ACTION_SAVE_AS" })
end

function ClickOpen()
  app.uiAction({ ["action"] = "ACTION_OPEN" })
end

-- background
function ClickRuledBG()
  app.changeCurrentPageBackground("ruled")
end

function ClickGraphBG()
  app.changeCurrentPageBackground("graph")
end

function ClickIsometricGraphBG()
  app.changeCurrentPageBackground("isograph")
end

function ClickDottedGraphBG()
  app.changeCurrentPageBackground("dotted")
end

function ClickIsometricDottedGraphBG()
  app.changeCurrentPageBackground("isodotted")
end

function ClickPlainBG()
  app.changeCurrentPageBackground("plain")
end

function SetPlaceholderValue(placeholder, val)
  -- Only if setPlaceholderValue is available (Xournal++ >= 1.2.8 (or 1.2.7+dev))
  if app.setPlaceholderValue then
    app.setPlaceholderValue(placeholder, val)
  end
end

-- API module with lowercase function names for consistency
local api = {}

-- Line width functions
api.clickVeryFine = ClickVeryFine
api.clickFine = ClickFine
api.clickMedium = ClickMedium
api.clickThick = ClickThick
api.clickVeryThick = ClickVeryThick

-- Tool functions
api.clickPen = ClickPen
api.clickEraser = ClickEraser
api.clickHighlighter = ClickHighlighter
api.clickSelectRegion = ClickSelectRegion
api.clickSelectRectangle = ClickSelectRectangle
api.clickSelectObject = ClickSelectObject
api.clickTex = ClickTex
api.clickText = ClickText
api.clickHand = ClickHand
api.clickDelete = ClickDelete
api.getToolInfo = GetToolInfo

-- Shape functions
api.clickRuler = ClickRuler
api.clickArrow = ClickArrow
api.clickEllipse = ClickEllipse
api.clickRectangle = ClickRectangle
api.clickSpline = ClickSpline
api.clickPlain = ClickPlain
api.clickFill = ClickFill

-- Line style functions
api.clickDotted = ClickDotted
api.clickDashed = ClickDashed
api.clickDashDotted = ClickDashDotted

-- Color functions
api.changeToolColor = ChangeToolColor
api.getColorPalette = GetColorPalette

-- Page functions
api.clickCopyPage = ClickCopyPage
api.clickMoveUp = ClickMoveUp
api.clickMoveDown = ClickMoveDown
api.clickNewBefore = ClickNewBefore
api.clickNewAfter = ClickNewAfter
api.clickNewLayer = ClickNewLayer
api.clickRuledBG = ClickRuledBG
api.clickGraphBG = ClickGraphBG
api.clickIsometricGraphBG = ClickIsometricGraphBG
api.clickDottedGraphBG = ClickDottedGraphBG
api.clickIsometricDottedGraphBG = ClickIsometricDottedGraphBG
api.clickPlainBG = ClickPlainBG

-- Navigation functions
api.clickGoToTop = ClickGoToTop
api.clickGoToBottom = ClickGoToBottom
api.clickScrollPageDown = ClickScrollPageDown
api.clickScrollPageUp = ClickScrollPageUp
api.clickLayerUp = ClickLayerUp
api.clickLayerDown = ClickLayerDown

-- File functions
api.clickAnnotatePDF = ClickAnnotatePDF
api.clickExportAsPDF = ClickExportAsPDF
api.clickSave = ClickSave
api.clickOpen = ClickOpen

-- History functions
api.clickUndo = ClickUndo
api.clickRedo = ClickRedo

-- Zoom functions
api.clickZoomIn = ClickZoomIn
api.clickZoomOut = ClickZoomOut

-- Utility functions
api.setPlaceholderValue = SetPlaceholderValue

return api
