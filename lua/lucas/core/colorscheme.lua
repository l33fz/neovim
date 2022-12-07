-- set colorscheme with protected call in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme vim-monokai-tasty")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

-- Custom Color Schemes
-- * onedarker
-- * moonfly
-- * vim-monokai-tasty
-- * material
