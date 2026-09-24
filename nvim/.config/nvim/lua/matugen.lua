 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#21201f',
    base01 = '#333230',
    base02 = '#3e3c3a',
    base03 = '#6b6a67',
    base04 = '#918e8b',
    base05 = '#c6c2be',
    base06 = '#c6c2be',
    base07 = '#c6c2be',
    base08 = '#c96154',
    base09 = '#91bb82',
    base0A = '#ba9e6d',
    base0B = '#b89551',
    base0C = '#ace996',
    base0D = '#e9cd96',
    base0E = '#e9cb96',
    base0F = '#f4e0be',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#c6c2be',          bg = '#21201f' })
  hi('TelescopeBorder',         { fg = '#6b6a67',             bg = '#21201f' })
  hi('TelescopePromptNormal',   { fg = '#c6c2be',          bg = '#21201f' })
  hi('TelescopePromptBorder',   { fg = '#6b6a67',             bg = '#21201f' })
  hi('TelescopePromptPrefix',   { fg = '#b89551',             bg = '#21201f' })
  hi('TelescopePromptCounter',  { fg = '#918e8b',  bg = '#21201f' })
  hi('TelescopePromptTitle',    { fg = '#21201f',             bg = '#b89551' })
  hi('TelescopePreviewTitle',   { fg = '#21201f',             bg = '#ba9e6d' })
  hi('TelescopeResultsTitle',   { fg = '#21201f',             bg = '#91bb82' })
  hi('TelescopeSelection',      { fg = '#c6c2be',          bg = '#3e3c3a' })
  hi('TelescopeSelectionCaret', { fg = '#b89551',             bg = '#3e3c3a' })
  hi('TelescopeMatching',       { fg = '#b89551',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#c6c2be',          bg = '#21201f' })
  hi('MiniPickBorder',         { fg = '#6b6a67',             bg = '#21201f' })
  hi('MiniPickPrompt',   { fg = '#c6c2be',          bg = '#21201f' })
  hi('MiniPickPromptPrefix',   { fg = '#b89551',             bg = '#21201f' })
  hi('MiniPickBorderText',    { fg = '#21201f',             bg = '#b89551' })
  hi('MiniPickMatchCurrent',      { fg = '#c6c2be',          bg = '#3e3c3a' })
  hi('MiniPickPromptCaret', { fg = '#b89551',             bg = '#3e3c3a' })
  hi('MiniPickMatchRanges',       { fg = '#b89551',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
