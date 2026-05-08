return {

  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        keymaps = {
          ["<ESC>"] = "actions.close",
          ["q"] = "actions.close",
          ["?"] = "actions.show_help",
        },
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- @type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
    config = function()
      require("flash").setup({
        modes = {
          char = {
            enabled = false,
          },
        },
      })
    end,
  },

  {
    "azabiong/vim-highlighter",
    init = function()
      vim.cmd([[
        let HiSet   = 'f<CR>'
        let HiErase = 'f<BS>'
        let HiClear = 'f<C-l>'
        let HiFind  = 'f<Tab>'
        " let HiSetSL = 't<CR>'
        ]])

      -- vim.keymap.set("n", "g<cr>", "<cmd>Hi><CR>")
      -- vim.keymap.set("n", "gb<cr>", "<cmd>Hi<<CR>")
      -- nn <CR>   <Cmd>Hi><CR>
      -- nn g<CR>  <Cmd>Hi<<CR>
      -- nn ]<CR>  <Cmd>Hi}<CR>
      -- nn [<CR>  <Cmd>Hi{<CR>
    end,
  },

  -- {
  --   "stevearc/aerial.nvim",
  --   opts = {},
  --   -- Optional dependencies
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("aerial").setup({
  --       -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  --       on_attach = function(bufnr)
  --         -- Jump forwards/backwards with '{' and '}'
  --         vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
  --         vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  --       end,
  --     })
  --     -- You probably also want to set a keymap to toggle aerial
  --     vim.keymap.set("n", "<leader>aa", "<cmd>AerialToggle!<CR>")
  --   end,
  -- },

  {
    "rgroli/other.nvim",
    config = function()
      require("other-nvim").setup({
        mappings = {
          -- builtin mappings
          -- "livewire",
          -- "angular",
          -- "laravel",
          "rails",
          -- "golang",
          -- custom mapping
          -- {
          --     pattern = "/path/to/file/src/app/(.*)/.*.ext$",
          --     target = "/path/to/file/src/view/%1/",
          --     transformer = "lowercase"
          -- }
        },
        transformers = {
          -- defining a custom transformer
          -- lowercase = function (inputString)
          --     return inputString:lower()
          -- end
        },
        style = {
          -- How the plugin paints its window borders
          -- Allowed values are none, single, double, rounded, solid and shadow
          border = "solid",

          -- Column seperator for the window
          seperator = "|",

          -- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
          width = 0.7,

          -- min height in rows.
          -- when more columns are needed this value is extended automatically
          minHeight = 2,
        },
      })

      vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>:Other<CR>", { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("n", "<leader>ltn", "<cmd>:OtherTabNew<CR>", { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("n", "<leader>lp", "<cmd>:OtherSplit<CR>", { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("n", "<leader>lv", "<cmd>:OtherVSplit<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>lc", "<cmd>:OtherClear<CR>", { noremap = true, silent = true })

      -- Context specific bindings
      -- vim.api.nvim_set_keymap("n", "<leader>lt", "<cmd>:Other test<CR>", { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("n", "<leader>ls", "<cmd>:Other scss<CR>", { noremap = true, silent = true })
    end,
  },
}
