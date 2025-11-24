return {
  {
    "olimorris/codecompanion.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({

        strategies = {
          chat = {
            adapter = "anthropic",
            keymaps = {
              send = {
                modes = { n = "<C-s>", i = "<C-s>" },
              },
              close = {
                modes = { n = "<C-c>", i = "<C-c>" },
              },
              -- Add further custom keymaps here
            },
          },
          inline = {
            adapter = "anthropic",
          },
        },
        adapters = {
          anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key = "cmd:op read op://personal/ClaudeAPI/credential --no-newline",
              },
            })
          end,
          openai = function()
            return require("codecompanion.adapters").extend("openai", {
              env = {
                api_key = "cmd:op read op://personal/OpenAI/credential --no-newline",
              },
            })
          end,
        },
      })
    end,
  },
}
