-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map({ "n", "v" }, "l", "n", { remap = true })
map({ "n", "v" }, "m", "h", { remap = true })
map({ "n", "v" }, "n", "j", { remap = true })
map({ "n", "v" }, "e", "k", { remap = true })
map({ "n", "v" }, "i", "l", { remap = true })
map({ "n", "v" }, "L", "N", { remap = true })
map({ "n", "v" }, "M", "H", { remap = true })
map({ "n", "v" }, "N", "J", { remap = true })
map({ "n", "v" }, "E", "K", { remap = true })
map("n", "<C-m>", "<C-w>h", { remap = true })
map("n", "<C-n>", "<C-w>j", { remap = true })
map("n", "<C-e>", "<C-w>k", { remap = true })
map("n", "<C-i>", "<C-w>l", { remap = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "l", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "l", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "l", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "L", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "L", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "L", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
