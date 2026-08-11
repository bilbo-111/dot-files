-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Exit insert mode
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "fd", "<Esc>", { desc = "Exit insert mode" })

-- Re-centre screen after movements (excluding h,j,k,l)
-- search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- half-page jumps
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- big jumps
map("n", "G", "Gzz")
-- paragraph movement (including visual mode)
map("n", "}", "}zz")
map("n", "{", "{zz")
map("v", "}", "}zz")
map("v", "{", "{zz")
-- undo/redo
map("n", "u", "uzz")
map("n", "<C-r>", "<C-r>zz")

-- PERSONAL KEYBINDS GROUP
local wk = require("which-key")
wk.add({
  -- Group header (this makes <leader>z show up)
  { "<leader>z", group = "Personal Keybinds", icon = "👤" },

  -- Leetcode mappings
  {
    "<leader>zl",
    "<cmd>Leet<cr>",
    desc = "LeetCode menu",
  },
  {
    "<leader>zr",
    "<cmd>Leet run<cr>",
    desc = "LeetCode run tests",
  },
  {
    "<leader>zs",
    "<cmd>Leet submit<cr>",
    desc = "LeetCode submit solution",
  },
  {
    "<leader>zc",
    "<cmd>Leet console<cr>",
    desc = "LeetCode console",
  },
  {
    "<leader>zi",
    "<cmd>Leet info<cr>",
    desc = "LeetCode info",
  },
  {
    "<leader>zo",
    "<cmd>Leet open<cr>",
    desc = "LeetCode open in browser",
  },
  {
    "<leader>zn",
    "<cmd>Leet lang<cr>",
    desc = "LeetCode switch language",
  },
})
