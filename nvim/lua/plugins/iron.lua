return {
  {
    "hkupty/iron.nvim",
    version = false,
    dependencies = {
      "kana/vim-textobj-user",
    },
    config = function()
      local iron = require("iron.core")

      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            python = {
              command = { "ipython", "--no-autoindent" },
              format = require("iron.fts.common").bracketed_paste_python,
              block_dividers = { "# %%", "#%%" },
            },
          },
          repl_open_cmd = require("iron.view").right(60),
          highlight_last = false,
        },

        keymaps = {
          send_motion = "<leader>rv",
          visual_send = "<leader>rv",
          send_file = "<leader>rf",
          send_line = "<leader>rl",
          send_until_cursor = "<leader>ru",
          interrupt = "<leader>rx",
          exit = "<leader>rq",
        },
      })

      -- کی‌مپ‌های پایه
      vim.keymap.set("n", "<leader>ri", "<cmd>IronRepl<cr>", { desc = "Iron: Start REPL" })
      vim.keymap.set("n", "<leader>rr", "<cmd>IronRestart<cr>", { desc = "Iron: Restart REPL" })

      -- 🔥 ارسال سلول فعلی (روش درست و پایدار)
      vim.keymap.set("n", "<leader>rc", function()
        local buf = vim.api.nvim_get_current_buf()

        -- پیدا کردن شروع سلول
        local start_line = vim.fn.search("^# %%", "bcnW")
        if start_line == 0 then start_line = 1 end

        -- پیدا کردن پایان سلول
        local end_line = vim.fn.search("^# %%", "nW") - 1
        if end_line < start_line then
          end_line = vim.fn.line("$")
        end

        -- گرفتن خطوط سلول
        local lines = vim.api.nvim_buf_get_lines(buf, start_line - 1, end_line, false)

        -- ارسال به iron
        iron.send(nil, table.concat(lines, "\n"))

        print(string.format("Cell Sent (%d-%d line)", start_line, end_line))
      end, { desc = "Iron: Send current cell", silent = true })

      -- توجه: ناوبری بین سلول‌ها (]c و [c) دیگر اینجا تعریف نشده،
      -- چون هم در keymaps.lua و هم در molten.lua به آن نیاز بود.
      -- این کلیدها حالا فقط یک‌بار، در keymaps.lua تعریف شده‌اند
      -- و برای هر دوی Iron و Molten کار می‌کنند (چون فقط بین مارکرهای
      -- متنی "# %%" حرکت می‌کنند، نه یک قابلیت اختصاصی هر پلاگین).
    end,
  },
}
