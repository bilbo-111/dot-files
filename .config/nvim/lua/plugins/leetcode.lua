return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- using telescope as picker
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      ---@type lc.picker
      picker = {
        provider = "telescope",
      },

      ---@type lc.lang
      lang = "python3",
    },

    -- console on bottom of screen instead of default floating
    console = {
      open_on_runcode = true, ---@type boolean
      dir = "row", ---@type lc.direction
      size = { ---@type lc.size
        width = "90%",
        height = "30%", -- adjust to taste
      },
      result = {
        size = "60%", ---@type lc.size
      },
    },
  },
}
