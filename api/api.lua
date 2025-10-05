-- primary tools
function ClickPen()
  app.uiAction({ ["action"] = "ACTION_TOOL_PEN" })
end

function ClickEraser()
  app.uiAction({ ["action"] = "ACTION_TOOL_ERASER" })
end

function ClickHighlighter()
  app.uiAction({ ["action"] = "ACTION_TOOL_HIGHLIGHTER" })
end

function ClickLaserPen()
  app.uiAction({ ["action"] = "ACTION_TOOL_LASER_POINTER_PEN" })
end

function ClickLaserHighlighter()
  app.uiAction({ ["action"] = "ACTION_TOOL_LASER_POINTER_HIGHLIGHTER" })
end

function ClickHand()
  app.uiAction({ ["action"] = "ACTION_TOOL_HAND" })
end

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

-- secondary tools
function ClickTex()
  app.uiAction({ ["action"] = "ACTION_TEX" })
end

function ClickText()
  app.uiAction({ ["action"] = "ACTION_TOOL_TEXT" })
end

function ClickImage()
  app.uiAction({ ["action"] = "ACTION_TOOL_IMAGE" })
end

function ClickSelectFont()
  app.uiAction({ ["action"] = "ACTION_SELECT_FONT" })
end

-- linestyle
function ClickPlain()
  app.uiAction({ ["action"] = "ACTION_TOOL_LINE_STYLE_PLAIN" })
end

function ClickDotted()
  app.uiAction({ ["action"] = "ACTION_TOOL_LINE_STYLE_DOT" })
end

function ClickDashed()
  app.uiAction({ ["action"] = "ACTION_TOOL_LINE_STYLE_DASH" })
end

function ClickDashDotted()
  app.uiAction({ ["action"] = "ACTION_TOOL_LINE_STYLE_DASH_DOT" })
end

-- Edit
function ClickUndo()
  app.uiAction({ ["action"] = "ACTION_UNDO" })
end

function ClickRedo()
  app.uiAction({ ["action"] = "ACTION_REDO" })
end

function ClickDelete()
  app.uiAction({ ["action"] = "ACTION_DELETE" })
end

function ClickCopy()
  app.uiAction({ ["action"] = "ACTION_COPY" })
end

function ClickCut()
  app.uiAction({ ["action"] = "ACTION_CUT" })
end

function ClickPaste()
  app.uiAction({ ["action"] = "ACTION_PASTE" })
end

-- Selection
function ClickSelectAll()
  app.uiAction({ ["action"] = "ACTION_SELECT_ALL" })
end

function ClickSelectRectangle()
  app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_RECT" })
end

function ClickSelectMultilayerRectangle()
  app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_MULTILAYER_RECT" })
end

function ClickSelectRegion()
  app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_REGION" })
end

function ClickSelectMultilayerRegion()
  app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_MULTILAYER_REGION" })
end

function ClickSelectTextLinear()
  app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_PDF_TEXT_LINEAR" })
end

function ClickSelectTextRectangular()
  app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_PDF_TEXT_RECT" })
end

-- shapes
function ClickProtractor()
  app.uiAction({ ["action"] = "ACTION_COMPASS" })
end

function ClickSetsquare()
  app.uiAction({ ["action"] = "ACTION_SETSQUARE" })
end

function ClickVerticalSpace()
  app.uiAction({ ["action"] = "ACTION_TOOL_VERTICAL_SPACE" })
end

function ClickGridSnapping(enabled)
  app.uiAction({ ["action"] = "ACTION_GRID_SNAPPING", ["enabled"] = enabled })
end

function ClickRotationSnapping(enabled)
  app.uiAction({ ["action"] = "ACTION_ROTATION_SNAPPING", ["enabled"] = enabled })
end

function ClickRuler(enabled)
  app.uiAction({ ["action"] = "ACTION_RULER", ["enabled"] = enabled })
end

function ClickArrow(enabled)
  app.uiAction({ ["action"] = "ACTION_TOOL_DRAW_ARROW", ["enabled"] = enabled })
end

function ClickDoubleArrow(enabled)
  app.uiAction({ ["action"] = "ACTION_TOOL_DRAW_DOUBLE_ARROW", ["enabled"] = enabled })
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

function ClickCoordinateSystem(enabled)
  app.uiAction({ ["action"] = "ACTION_TOOL_DRAW_COORDINATE_SYSTEM", ["enabled"] = enabled })
end

function ClickShapeRecognizer(enabled)
  app.uiAction({ ["action"] = "ACTION_SHAPE_RECOGNIZER", ["enabled"] = enabled })
end

-- fills
function ClickFill(enabled)
  app.uiAction({ ["action"] = "ACTION_TOOL_PEN_FILL", ["enabled"] = enabled })
end

function ClickPenFillOpacity()
  app.uiAction({ ["action"] = "ACTION_TOOL_PEN_FILL_OPACITY" })
end

function ClickHighlighterFillOpacity()
  app.uiAction({ ["action"] = "ACTION_TOOL_HIGHLIGHTER_FILL_OPACITY" })
end

-- files
function ClickNew()
  app.uiAction({ ["action"] = "ACTION_NEW" })
end

function ClickOpen()
  app.uiAction({ ["action"] = "ACTION_OPEN" })
end

function ClickAnnotatePDF()
  app.uiAction({ ["action"] = "ACTION_ANNOTATE_PDF" })
end

function ClickSave()
  app.uiAction({ ["action"] = "ACTION_SAVE" })
end

function ClickSaveAs()
  app.uiAction({ ["action"] = "ACTION_SAVE_AS" })
end

function ClickExportAsPDF()
  app.uiAction({ ["action"] = "ACTION_EXPORT_AS_PDF" })
end

function ClickExportAs()
  app.uiAction({ ["action"] = "ACTION_EXPORT_AS" })
end

function ClickPrint()
  app.uiAction({ ["action"] = "ACTION_PRINT" })
end

function ClickQuit()
  app.uiAction({ ["action"] = "ACTION_QUIT" })
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

---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------

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

-- other
function SetPlaceholderValue(placeholder, val)
  -- Only if setPlaceholderValue is available (Xournal++ >= 1.2.8 (or 1.2.7+dev))
  if app.setPlaceholderValue then
    app.setPlaceholderValue(placeholder, val)
  end
end

function GetToolInfo(tool)
  return app.getToolInfo(tool)
end

-- Export all
return _G
