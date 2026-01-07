return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add or skip adding a new cursor by matching word/selection
      set({ "n", "x" }, "<leader>n", function()
        mc.matchAddCursor(1)
      end)
      -- set({ "n", "x" }, "<leader>s", function()
      --   mc.matchSkipCursor(1)
      -- end)
      set({ "n", "x" }, "<leader>N", function()
        mc.matchAddCursor(-1)
      end)
      -- set({ "n", "x" }, "<leader>S", function()
      --   mc.matchSkipCursor(-1)
      -- end)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ "n", "x" }, "<left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<right>", mc.nextCursor)

        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)
    end,
  },
}
