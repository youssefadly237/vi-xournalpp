---@class State
---@field currentMode string
---@field lastPage integer
---@field sticky boolean
local state = {
  currentMode = 'tool',
  lastPage = 1,
  sticky = false,
}

return state
