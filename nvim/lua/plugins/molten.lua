return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  dependencies = { "3rd/image.nvim" },
  build = ":UpdateRemotePlugins",
  init = function()
    -- استفاده از image.nvim برای نمایش تصویر (پروتکل گرافیکی کیتی)
    vim.g.molten_image_provider = "image.nvim"

    -- حداکثر ارتفاع پنجره‌ی خروجی (به تعداد خط) قبل از اسکرول شدن
    vim.g.molten_output_win_max_height = 20

    -- مارکر تشخیص مرز سلول‌ها (هماهنگ با iron.lua و jupytext)
    vim.g.molten_cell_marker = "# %%"

    -- باز شدن خودکار پنجره‌ی خروجی بعد از اجرای سلول
    vim.g.molten_auto_open_output = true

    -- پیچیدن خطوط طولانی خروجی به‌جای سرریز افقی
    vim.g.molten_wrap_output = true

    -- نمایش متن مجازی با شماره‌ی اجرا (شبیه In [1]: در Jupyter)
    vim.g.molten_virt_text_output = false
    vim.g.molten_virt_lines_off_by_1 = true

    -- کادر گردگوشه برای پنجره‌ی خروجی (صرفاً بصری)
    vim.g.molten_output_win_border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

    -- رنگ‌بندی کادر بر اساس موفقیت/خطا (نیاز به هایلایت‌گروه‌های متناظر
    -- در کالراسکیمت دارد؛ اگر تعریف نشده باشند، بی‌اثر می‌ماند)
    vim.g.molten_use_border_highlights = true

    -- محدود کردن تعداد خطوط متن مجازی خروجی قبل از کوتاه شدن
    vim.g.molten_virt_text_max_lines = 12
  end,
  keys = {
    { "<leader>mi", ":MoltenInit<CR>", desc = "Molten: Init kernel" },
    { "<leader>me", ":MoltenEvaluateOperator<CR>", desc = "Molten: Evaluate code (operator)" },
    { "<leader>ml", ":MoltenEvaluateLine<CR>", desc = "Molten: Evaluate current line" },
    { "<leader>mc", ":MoltenReevaluateCell<CR>", desc = "Molten: Re-evaluate cell" },
    { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", desc = "Molten: Evaluate visual selection", mode = "v" },
    { "<leader>md", ":MoltenDelete<CR>", desc = "Molten: Delete cell output" },
    { "<leader>mx", ":MoltenInterrupt<CR>", desc = "Molten: Interrupt execution" },
    { "<leader>mo", ":noautocmd MoltenEnterOutput<CR>", desc = "Molten: Enter output window" },
    { "<leader>mh", ":MoltenHideOutput<CR>", desc = "Molten: Hide output" },
    { "<leader>mr", ":MoltenRestart<CR>", desc = "Molten: Restart kernel" },
    { "<leader>ms", ":MoltenSave<CR>", desc = "Molten: Save outputs to file" },
    { "<leader>mL", ":MoltenLoad<CR>", desc = "Molten: Load outputs from file" },
  },
}
