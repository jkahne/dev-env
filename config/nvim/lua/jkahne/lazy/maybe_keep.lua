return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.icons").setup()
      require("mini.files").setup({
        windows = {
          preview = true,
        },
      })

      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },

  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
      --
      -- All of these are just the defaults
      --
      enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
      trigger_events = { -- See :h events
        immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
        defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
        cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
      },
      -- function that takes the buffer handle and determines whether to save the current buffer or not
      -- return true: if buffer is ok to be saved
      -- return false: if it's not ok to be saved
      -- if set to `nil` then no specific condition is applied
      -- condition = nil,
      condition = function(buf)
        local filetype = vim.bo[buf].filetype
        if filetype == "harpoon" then -- or filetype == "mysql" then
          return false
        end

        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        -- don't save for `sql` file types
        if utils.not_in(fn.getbufvar(buf, "&filetype"), { "sql" }) then
          return true
        end
        return false
      end,
      write_all_buffers = false, -- write all buffers when the current one meets `condition`
      noautocmd = false, -- do not execute autocmds when saving
      lockmarks = false, -- lock marks when saving, see `:h lockmarks` for more details
      debounce_delay = 1000, -- delay after which a pending save is executed
      -- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
      debug = false,
    },
  },
  -- this is enabled on work laptop
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("lualine").setup({
  --       sections = {
  --         lualine_x = {
  --           {
  --             require("noice").api.statusline.mode.get,
  --             cond = require("noice").api.statusline.mode.has,
  --             color = { fg = "#ff9e64" },
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("noice").setup({
        cmdline = {
          enabled = true,
          view = "cmdline", -- Use default cmdline position
        },
        messages = {
          enabled = true,
          view = "notify", -- This keeps the notifications in the corner
          view_error = "notify",
          view_warn = "notify",
          view_history = "messages",
        },
        popupmenu = {
          enabled = true,
          backend = "nui",
        },
        notify = {
          enabled = true,
          view = "notify",
        },
        lsp = {
          progress = {
            enabled = true,
            view = "notify",
          },
        },
      })
    end,
  },
  -- tidy up spaces at EOL on save
  {
    "mcauley-penney/tidy.nvim",
    opts = {
      enabled_on_save = true,
      filetype_exclude = { "markdown", "diff" },
    },
    -- init = function()
    --   vim.keymap.set("n", "<leader>tt", require("tidy").toggle, {})
    --   vim.keymap.set("n", "<leader>tr", require("tidy").run, {})
    -- end,
  },
}
