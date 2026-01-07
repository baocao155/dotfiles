-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

vim.keymap.set("n", "<leader><space>", LazyVim.pick("files", { root = false }))

-- { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" }

-- local nvim_tmux_nav = require("nvim-tmux-navigation")
-- local keymap = vim.keymap
--
-- keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
-- keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
-- keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
-- keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
-- keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
--
-- vim.keymap.set("n", "<leader>am", function()
--   vim.api.nvim_exec_autocmds("User", { pattern = "ToggleMyPrompt" })
-- end, { desc = "avante: toggle my prompt" })
