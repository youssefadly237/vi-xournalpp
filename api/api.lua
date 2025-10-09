-- primary tools
function ClickPen()
  app.changeActionState("select-tool", app.C.Tool_pen)
end

function ClickEraser()
  app.changeActionState("select-tool", app.C.Tool_eraser)
end

function ClickHighlighter()
  app.changeActionState("select-tool", app.C.Tool_highlighter)
end

function ClickLaserPen()
  app.changeActionState("select-tool", app.C.Tool_laserPointerPen)
end

function ClickLaserHighlighter()
  app.changeActionState("select-tool", app.C.Tool_laserPointerHighlighter)
end

function ClickHand()
  app.changeActionState("select-tool", app.C.Tool_hand)
end

-- line width
function ClickVeryFine()
  app.changeActionState("tool-size", app.C.ToolSize_veryThin)
end

function ClickFine()
  app.changeActionState("tool-size", app.C.ToolSize_thin)
end

function ClickMedium()
  app.changeActionState("tool-size", app.C.ToolSize_medium)
end

function ClickThick()
  app.changeActionState("tool-size", app.C.ToolSize_thick)
end

function ClickVeryThick()
  app.changeActionState("tool-size", app.C.ToolSize_veryThick)
end

-- secondary tools
function ClickTex()
  app.activateAction("tex")
end

function ClickText()
  app.changeActionState("select-tool", app.C.Tool_text)
end

function ClickImage()
  app.changeActionState("select-tool", app.C.Tool_image)
end

function ClickSelectFont()
  app.activateAction("select-font")
end

-- linestyle
function ClickPlain()
  app.changeActionState("tool-pen-line-style", "plain")
end

function ClickDotted()
  app.changeActionState("tool-pen-line-style", "dot")
end

function ClickDashed()
  app.changeActionState("tool-pen-line-style", "dash")
end

function ClickDashDotted()
  app.changeActionState("tool-pen-line-style", "dashdot")
end

-- Edit
function ClickUndo()
  app.activateAction("undo")
end

function ClickRedo()
  app.activateAction("redo")
end

function ClickDelete()
  app.activateAction("delete")
end

function ClickCopy()
  app.activateAction("copy")
end

function ClickCut()
  app.activateAction("cut")
end

function ClickPaste()
  app.activateAction("paste")
end

-- Selection
function ClickSelectAll()
  app.activateAction("select-all")
end

function ClickSelectRectangle()
  app.changeActionState("select-tool", app.C.Tool_selectRect)
end

function ClickSelectMultilayerRectangle()
  app.changeActionState("select-tool", app.C.Tool_selectMultiLayerRect)
end

function ClickSelectRegion()
  app.changeActionState("select-tool", app.C.Tool_selectRegion)
end

function ClickSelectMultilayerRegion()
  app.changeActionState("select-tool", app.C.Tool_selectMultiLayerRegion)
end

function ClickSelectTextLinear()
  app.changeActionState("select-tool", app.C.Tool_selectPdfTextLinear)
end

function ClickSelectTextRectangular()
  app.changeActionState("select-tool", app.C.Tool_selectPdfTextRect)
end

-- shapes
function ClickProtractor()
  app.activateAction("compass")
end

function ClickSetsquare()
  app.activateAction("setsquare")
end

function ClickVerticalSpace()
  app.changeActionState("select-tool", app.C.Tool_verticalSpace)
end

function ClickGridSnapping()
  app.activateAction("grid-snapping")
end

function ClickRotationSnapping()
  app.activateAction("rotation-snapping")
end

-- Shape
function ClickLine()
  app.activateAction("tool-draw-line")
end

function ClickArrow()
  app.activateAction("tool-draw-arrow")
end

function ClickDoubleArrow()
  app.activateAction("tool-draw-double-arrow")
end

function ClickEllipse()
  app.activateAction("tool-draw-ellipse")
end

function ClickRectangle()
  app.activateAction("tool-draw-rectangle")
end

function ClickSpline()
  app.activateAction("tool-draw-spline")
end

function ClickCoordinateSystem()
  app.activateAction("tool-draw-coordinate-system")
end

function ClickShapeRecognizer()
  app.activateAction("tool-draw-shape-recognizer")
end

-- fills
function ClickFill()
  app.activateAction("tool-fill")
end

function ClickPenFillOpacity()
  app.activateAction("tool-pen-fill-opacity")
end

function ClickHighlighterFillOpacity()
  app.activateAction("tool-highlighter-fill-opacity")
end

-- files
function ClickNew()
  app.activateAction("new-file")
end

function ClickOpen()
  app.activateAction("open")
end

function ClickAnnotatePDF()
  app.activateAction("annotate-pdf")
end

function ClickSave()
  app.activateAction("save")
end

function ClickSaveAs()
  app.activateAction("save-as")
end

function ClickExportAsPDF()
  app.activateAction("export-as-pdf")
end

function ClickExportAs()
  app.activateAction("export-as")
end

function ClickPrint()
  app.activateAction("print")
end

function ClickQuit()
  app.activateAction("quit")
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
  app.activateAction("zoom-in")
end

function ClickZoomOut()
  app.activateAction("zoom-out")
end

-- page
function ClickCopyPage()
  app.activateAction("duplicate-page")
end

function ClickDeletePage()
  app.activateAction("delete-page")
end

function ClickMoveUp()
  app.activateAction("move-page-towards-beginning")
end

function ClickMoveDown()
  app.activateAction("move-page-towards-end")
end

function ClickNewBefore()
  app.activateAction("new-page-before")
end

function ClickNewAfter()
  app.activateAction("new-page-after")
end

function ClickNewLayer(pos)
  if pos == "top" then
    app.activateAction("layer-new-above-current")
  elseif pos == "bottom" then
    app.activateAction("layer-new-below-current")
  else
    app.activateAction("layer-new-above-current")
  end
end

function ClickDeleteLayer()
  app.activateAction("layer-delete")
end

-- navigation
function ClickGoToFirstPage()
  app.activateAction("goto-first")
end

function GoToPage(page)
  app.scrollToPage(page - 1, false)
end

function GoToPos(x, y)
  app.scrollToPos(x, y, true)
end

function ClickScrollPageDown()
  app.activateAction("goto-next")
end

function ClickScrollPageUp()
  app.activateAction("goto-previous")
end

function ClickGoToLastPage()
  app.activateAction("goto-last")
end

function CurrentPage()
  return app.getDocumentStructure()["currentPage"]
end

function ClickLayerDown()
  app.activateAction("layer-goto-previous")
end

function ClickLayerUp()
  app.activateAction("layer-goto-next")
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
  if app.setPlaceholderValue then
    app.setPlaceholderValue(placeholder, val)
  end
end

function GetToolInfo(tool)
  return app.getToolInfo(tool)
end

-- Export all
return _G
