return {
  -- {
  --   "otavioschwanck/arrow.nvim",
  --   -- dependencies = {
  --   --   { "nvim-tree/nvim-web-devicons" },
  --   -- or if using `mini.icons`
  --   -- { "echasnovski/mini.icons" },
  --   -- },
  --   opts = {
  --     show_icons = true,
  --     leader_key = ";", -- Recommended to be a single key
  --     buffer_leader_key = "m", -- Per Buffer Mappings
  --     always_show_path = true,
  --     mappings = {
  --       edit = "e",
  --       delete_mode = "d",
  --       clear_all_items = "C",
  --       toggle = "a",
  --       open_vertical = "<C-v>",
  --       open_horizontal = "<C-s>",
  --       quit = "q",
  --     },
  --   },
  --   -- config = function()
  --   --   vim.keymap.set("n", "H", require("arrow.persist").previous)
  --   --   vim.keymap.set("n", "L", require("arrow.persist").next)
  --   --   vim.keymap.set("n", "<C-s>", require("arrow.persist").toggle)
  --   -- end,
  -- },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end

      vim.keymap.set("n", "<C-S-u>", function()
        harpoon:list():add()
      end, { desc = "add a file to harpoon" })
      vim.keymap.set("n", "<C-S-i>", function()
        harpoon:list():remove()
      end, { desc = "remove a file from harpoon" })
      -- vim.keymap.set("n", "<C-S-m>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
      vim.keymap.set("n", "<C-S-m>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set("n", "<C-S-h>", function()
        harpoon:list():select(1)
      end, { desc = "open the first file in harpoon list" })
      vim.keymap.set("n", "<C-S-j>", function()
        harpoon:list():select(2)
      end, { desc = "open the second file in harpoon list" })
      vim.keymap.set("n", "<C-S-k>", function()
        harpoon:list():select(3)
      end, { desc = "open the third file in harpoon list" })
      vim.keymap.set("n", "<C-S-l>", function()
        harpoon:list():select(4)
      end, { desc = "open the fourth file in harpoon list" })
      --
      -- -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-P>", function()
        harpoon:list():prev()
      end, { desc = "open the previous file in harpoon list" })
      vim.keymap.set("n", "<C-S-N>", function()
        harpoon:list():next()
      end, { desc = "open the next file in harpoon list" })
    end,
  },
}
