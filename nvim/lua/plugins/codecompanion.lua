-- ~/.config/nvim/lua/plugins/codecompanion.lua
return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
  keys = {
    -- Toggle the chat panel
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI Chat Toggle" },
    -- Open the actions palette (inline edits, explain code, etc.)
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI Actions" },
    -- Add visually selected code to the chat as context
    { "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "AI Add to Chat" },
  },
  opts = {
    adapters = {
      -- NOTE: adapters must be nested under "http" in current plugin versions
      http = {
        openrouter = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://openrouter.ai/api",
              -- Reads the key from an environment variable, so the key
              -- itself never lives inside this config file.
              api_key = "OPENROUTER_API_KEY",
              chat_url = "/v1/chat/completions",
            },
            headers = {
              ["Content-Type"] = "application/json",
              ["Authorization"] = "Bearer ${api_key}",
            },
            schema = {
              model = {
                -- Free coding-focused model on OpenRouter (note the ":free" suffix).
                -- Swap this for any other model ending in ":free" from openrouter.ai/models
                default = "deepseek/deepseek-r1:free",
              },
            },
            handlers = {
              parse_message_meta = function(self, data)
                local extra = data.extra
                if extra and extra.reasoning then
                  data.output.reasoning = { content = extra.reasoning }
                  if data.output.content == "" then
                    data.output.content = nil
                  end
                end
                return data
              end,
            },
          })
        end,
      },
    },
    strategies = {
      chat = { adapter = "openrouter" },
      inline = { adapter = "openrouter" },
      cmd = { adapter = "openrouter" },
    },
    display = {
      chat = {
        window = {
          layout = "vertical", -- "vertical", "horizontal", "float", "buffer"
          width = 0.40,
        },
      },
    },
  },
}
