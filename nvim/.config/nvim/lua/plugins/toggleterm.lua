return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      -- configuration options (defaults or your overrides)
      size = 10,
      open_mapping = false, -- we will define our own keybinding
      hide_numbers = true,
      shade_terminals = true,
      direction = "horizontal",
      float_opts = {
        border = "curved",
        winblend = 3,
      },
    },
    keys = {
      {
        "<C-t>",
        function()
          require("toggleterm").toggle()
        end,
        desc = "Toggle Terminal",
        mode = { "n", "t" },
      },
    },
  },
}
