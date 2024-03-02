-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local keymap = vim.keymap

-- キーバインド
-- 画面分割
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
-- アクティブウィンドウの移動
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
keymap.set("n", "bd", ":bd<CR>")

-- jjでEscする
keymap.set("i", "jj", "<Esc>")
-- 設定ファイルを開く
-- keymap.set("n", "<F1>", ":edit $MYVIMRC<CR>")
--
-- telescope
local builtin = require("telescope.builtin")

-- vim.keymap.set("n", "<leader>ff", function()
--   builtin.find_files({
--     find_command = { "rg", "--files", "--hidden", "--grob !*.git" },
--   })
-- end)
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
