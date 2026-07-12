-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- اجرای کد با F5 (بسته به نوع فایل)
local function run_code()
  vim.cmd("w") -- اول فایل رو ذخیره کن
  local ft = vim.bo.filetype

  if ft == "python" then
    -- ✅ روش درست برای LazyVim
    vim.cmd("terminal python3 " .. vim.fn.expand("%:p"))
  elseif ft == "javascript" or ft == "typescript" then
    vim.cmd("terminal node " .. vim.fn.expand("%:p"))
  elseif ft == "lua" then
    vim.cmd("terminal lua " .. vim.fn.expand("%:p"))
  elseif ft == "rust" then
    vim.cmd("RustRun") -- اگر extra lang.rust فعال باشه
  elseif ft == "cpp" or ft == "c" then
    -- کامپایل و اجرا (ساده)
    local cmd = string.format("g++ %s -o /tmp/a.out && /tmp/a.out", vim.fn.expand("%:p"))
    vim.cmd("terminal bash -c " .. cmd)
  else
    -- برای بقیه فایل‌ها ترمینال باز کن
    vim.cmd("terminal")
  end
end

vim.keymap.set("n", "<F5>", run_code, { desc = "Run Code (F5)" })

-- توجه: کلیدهای مربوط به Molten (mi, ml, mv, mc, md, mx) از اینجا حذف شدند
-- و به فایل lua/plugins/molten.lua منتقل شدند (با keys = {...})، چون
-- تعریف آن‌ها در یک فایل جداگانه باعث می‌شد lazy-loading پلاگین درست
-- کار نکند و همچنین خطر تداخل/دوباره‌کاری با تعاریف داخل خود پلاگین
-- بیشتر می‌شد. همیشه بهتر است کلیدهای هر پلاگین کنار خودِ پلاگین
-- تعریف شوند، نه در یک فایل عمومی مثل این.

-- ناوبری بین سلول‌ها (]c و [c)
-- این پیاده‌سازی فقط یک‌بار اینجا تعریف شده و هم برای Iron و هم برای
-- Molten کار می‌کند، چون صرفاً بین مارکرهای متنی "# %%" حرکت می‌کند
-- و به دستورات داخلی هیچ‌کدام از پلاگین‌ها وابسته نیست (که مطمئن‌تر
-- است، چون Molten به‌صورت رسمی دستور MoltenNextCell/MoltenPrevCell
-- ندارد).
vim.keymap.set("n", "]c", function()
  vim.fn.search("^# %%", "W")
end, { desc = "Next cell", silent = true })

vim.keymap.set("n", "[c", function()
  vim.fn.search("^# %%", "bW")
end, { desc = "Previous cell", silent = true })
