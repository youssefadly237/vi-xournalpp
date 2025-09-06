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
  for _, tbl in ipairs({ ... }) do
    for k, v in pairs(tbl) do
      result[k] = v
    end
  end
  return result
end

return utils
