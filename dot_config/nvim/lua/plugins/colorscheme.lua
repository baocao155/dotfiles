return {
  -- {
  --   "projekt0n/github-nvim-theme",
  --   name = "github-theme",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("github-theme").setup({
  --       -- ...
  --     })
  --
  --     vim.cmd("colorscheme github_dark_high_contrast")
  --   end,
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({
        style = "night", -- The theme comes in storm, moon, a darker variant night and day
        transparent = true, -- Set to true if you want transparent background
        terminal_colors = true, -- Configure the colors for the terminal
        styles = {
          sidebars = "transparent",
          floats = "transparent", -- Optional: make floating windows transparent too
        },
      })

      -- Load the colorscheme
      -- vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
}
