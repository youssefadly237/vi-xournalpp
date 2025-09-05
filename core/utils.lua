local utils = {}

-- Helper function to clean all shape selections
function utils.cleanShape()
  local api = require("api.api")
  api.clickRuler(false)
  api.clickArrow(false)
  api.clickRectangle(false)
  api.clickEllipse(false)
  api.clickSpline(false)
  api.clickFill(false)
end

-- Helper function to merge tables
function utils.mergeTables(...)
  local result = {}
  local args = {...}
  
  -- Validate input
  if #args == 0 then
    return result
  end
  
  for i, tbl in ipairs(args) do
    if type(tbl) ~= "table" then
      print("Warning: mergeTables received non-table argument at position " .. i .. ": " .. type(tbl))
    else
      for k, v in pairs(tbl) do
        if result[k] ~= nil then
          print("Warning: Key '" .. tostring(k) .. "' already exists and will be overwritten")
        end
        result[k] = v
      end
    end
  end
  return result
end

return utils
