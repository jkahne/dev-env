return {
  {
    "hrsh7th/nvim-cmp",
    -- event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "luckasRanarison/tailwind-tools.nvim",
      "onsails/lspkind-nvim",
    },
    opts = function()
      return {
        formatting = {
          format = require("lspkind").cmp_format({
            before = require("tailwind-tools.cmp").lspkind_format,
          }),
        },
      }
    end,
  },

  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {}, -- your configuration
    config = function()
      vim.lsp.config("tailwind-tools", {
        document_color = {
          enabled = true, -- can be toggled by commands
          kind = "background", -- "inline" | "foreground" | "background"
        },

        vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>:TailwindColorToggle<CR>", { noremap = true, silent = true }),
      })
      vim.lsp.enable("tailwind-tools")
    end,
  },
}
