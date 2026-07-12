return {
  "nghiant03/jove.nvim",
  lazy = false, -- این یعنی به محض باز شدن Neovim بارگذاری بشه
  dependencies = {
    "benlubas/molten-nvim",
  },
  opts = {
    auto_kernel = true,
    auto_import_outputs = true,
    keymap = {
      -- همه‌ی کلیدها زیر پیشوند <leader>j (Jove) جمع شدند تا با
      -- گروه <leader>r (Iron) و گروه پیش‌فرض <leader>c (LazyVim
      -- code actions) تداخل نکنند.
      run_cell = "<leader>jc",
      run_all = "<leader>jA",
      next_cell = "]h",
      prev_cell = "[h",
      add_cell_below = "<leader>ja",
      delete_cell = "<leader>jd",
    },
  },
  -- توجه: بخش config حذف شد چون با opts تکراری بود. وقتی فقط opts
  -- تعریف شود، lazy.nvim خودش require("jove").setup(opts) را صدا
  -- می‌زند؛ نیازی به نوشتن config جدا برای همان مقادیر نیست.
}
