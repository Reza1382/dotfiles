-- ~/.config/nvim/lua/config/options.lua
-- Options are automatically loaded before lazy.nvim startup
-- LazyVim defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

-- Line numbers
opt.number = true -- Show absolute line number on current line
opt.relativenumber = false -- Keep numbers absolute (not relative to cursor)

-- Cursor & visual cues
opt.cursorline = true -- Highlight current line
opt.cursorcolumn = false -- Don't highlight current column

-- Text display
opt.wrap = false -- Don't soft-wrap long lines
opt.scrolloff = 8 -- Keep 8 lines of context above/below cursor
opt.sidescrolloff = 8 -- Same, but horizontally (useful with wrap=false)

-- UI
opt.showmode = false -- LazyVim already shows mode in the statusline

-- Spell checking (off by default; toggle per-buffer when needed)
opt.spell = true
opt.spelllang = "en"
-- Quick toggle: add to keymaps.lua if you want it
-- vim.keymap.set("n", "<leader>cs", "<cmd>set spell!<cr>", { desc = "Toggle spell check" })

-- Formatting
--vim.g.autoformat = true -- Auto-format on save via LazyVim's formatter
