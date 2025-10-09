local runtime = {}

local REQUIRED_APIS = {
  { name = "activateAction", desc = "New Action API" },
  { name = "changeActionState", desc = "New Action API" },
  { name = "getToolInfo", desc = "Tool information" },
  { name = "getDocumentStructure", desc = "Document access" },
  { name = "registerUi", desc = "Keybinding registration" },
}

local OPTIONAL_APIS = {
  { name = "getColorPalette", desc = "Dynamic color palette" },
  { name = "setPlaceholderValue", desc = "Status bar updates" },
  { name = "registerPlaceholder", desc = "Status bar registration" },
  { name = "scrollToPos", desc = "Navigation features" },
  { name = "changeToolColor", desc = "Color changing" },
  { name = "changeCurrentPageBackground", desc = "Background changing" },
}

local function apiExists(name)
  return app and type(app[name]) == "function"
end

local function constantsExist()
  return app and app.C and type(app.C) == "table"
end

function runtime.checkRuntime()
  local missing_critical = {}
  local missing_optional = {}
  local available = {}

  -- Check critical APIs
  for _, api in ipairs(REQUIRED_APIS) do
    if apiExists(api.name) then
      table.insert(available, api.name)
    else
      table.insert(missing_critical, api)
    end
  end

  -- Check optional APIs
  for _, api in ipairs(OPTIONAL_APIS) do
    if apiExists(api.name) then
      table.insert(available, api.name)
    else
      table.insert(missing_optional, api)
    end
  end

  -- Check constants table
  local has_constants = constantsExist()

  return {
    missing_critical = missing_critical,
    missing_optional = missing_optional,
    available = available,
    has_constants = has_constants,
    is_compatible = #missing_critical == 0 and has_constants,
  }
end

function runtime.printReport(results)
  print("[vi-xournalpp] Runtime Compatibility Check")

  if results.is_compatible then
    print("[vi-xournalpp] Compatible Xournal++ version detected")
    print("[vi-xournalpp] Available APIs: " .. #results.available)

    if #results.missing_optional > 0 then
      print()
      print("[vi-xournalpp] WARNING: Optional features unavailable:")
      for _, api in ipairs(results.missing_optional) do
        print("[vi-xournalpp]   - " .. api.name .. ": " .. api.desc)
      end
      print("[vi-xournalpp] Plugin will work with limited functionality")
    end

    return true
  else
    print("[vi-xournalpp] ERROR: Incompatible Xournal++ version")
    print()

    if not results.has_constants then
      print("[vi-xournalpp] Missing: app.C constants table")
      print("[vi-xournalpp]   Required for tool/size/action enums")
      print()
    end

    if #results.missing_critical > 0 then
      print("[vi-xournalpp] Missing critical APIs:")
      for _, api in ipairs(results.missing_critical) do
        print("[vi-xournalpp]   - " .. api.name .. ": " .. api.desc)
      end
      print()
    end

    print("[vi-xournalpp] This plugin requires Xournal++ nightly (1.2.8+dev)")
    print(
      "[vi-xournalpp] Download it from: https://github.com/xournalpp/xournalpp/releases/tag/nightly"
    )
    print(
      "[vi-xournalpp] Or build from source: https://github.com/xournalpp/xournalpp/?tab=readme-ov-file#building"
    )
    print()

    return false
  end
end

return runtime
