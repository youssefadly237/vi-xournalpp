local api = require("api.api")

return {
  -- Edit mode selections

  lasso = {
    description = "Lasso Selection",
    buttons = { "e" },
    modes = { "edit" },
    call = function()
      api.ClickSelectRegion()
    end,
  },
  selectRectangle = {
    description = "Rectangle Selection",
    buttons = { "r" },
    modes = { "edit" },
    call = function()
      api.ClickSelectRectangle()
    end,
  },
  --   tex = {
  --   description = "LaTeX",
  --   buttons = { "n" },
  --   modes = { "tool" },
  --   call = function()
  --     api.ClickTex()
  --     utils.cleanShape()
  --   end,
  -- },

  -- text = {
  --   description = "Text",
  --   buttons = { "x" },
  --   modes = { "tool" },
  --   call = function()
  --     api.ClickText()
  --     utils.cleanShape()
  --   end,
  -- },
}
