return {

  {
    "lukas-reineke/headlines.nvim",
    enabled = true,
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      -- Define custom highlight groups using Vimscript
      vim.cmd([[highlight Headline1 guibg=#c792ea guifg=black]])
      vim.cmd([[highlight Headline2 guibg=#89ddff guifg=black]])
      vim.cmd([[highlight Headline3 guibg=#33728e guifg=white]])
      vim.cmd([[highlight Headline4 guibg=#274d61 guifg=white]])
      vim.cmd([[highlight Headline5 guibg=#163242 guifg=white]])
      vim.cmd([[highlight Headline6 guibg=#7e0000 guifg=white]])

      -- vim.cmd([[highlight Headline1 guibg=#295715 guifg=white]])
      -- vim.cmd([[highlight Headline2 guibg=#8d8200 guifg=white]])
      -- vim.cmd([[highlight Headline3 guibg=#a56106 guifg=white]])
      -- vim.cmd([[highlight Headline4 guibg=#7e0000 guifg=white]])
      -- vim.cmd([[highlight Headline5 guibg=#1e0b7b guifg=white]])
      -- vim.cmd([[highlight Headline6 guibg=#560b7b guifg=white]])

      -- Defines the codeblock background color to something darker
      -- vim.cmd([[highlight CodeBlock guibg=#09090d]])
      -- When you add a line of dashes with --- this specifies the color, I'm not
      -- adding a "guibg" but you can do so if you want to add a background color
      vim.cmd([[highlight Dash guifg=white]])

      -- Setup headlines.nvim with the newly defined highlight groups
      require("headlines").setup({
        markdown = {
          -- If set to false, headlines will be a single line and there will be no
          -- "fat_headline_upper_string" and no "fat_headline_lower_string"
          fat_headlines = false,
          --
          -- Lines added above and below the header line makes it look thicker
          -- "lower half block" unicode symbol hex:2584
          -- "upper half block" unicode symbol hex:2580
          -- fat_headline_upper_string = "▄",
          -- fat_headline_lower_string = " ", --  "▀",
          --
          -- You could add a full block if you really like it thick ;)
          -- fat_headline_upper_string = "█",
          -- fat_headline_lower_string = "█",
          --
          -- Other set of lower and upper symbols to try
          -- fat_headline_upper_string = "▃",
          -- fat_headline_lower_string = "-",
          --
          headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
          },
        },
      })
    end,
  },

  {
    -- This plugin automatically adds bulletpoints on the next line respecting
    -- indentation
    -- In markdown or a text file start a bulleted list using - or *. Press return
    -- to go to the next line, a new list item will be created.
    --
    -- When in insert mode, you can increase indentation with ctrl+t and decrease it
    -- with ctrl+d
    --
    -- By default its enabled on filetypes 'markdown', 'text', 'gitcommit', 'scratch'
    -- https://github.com/bullets-vim/bullets.vim
    "bullets-vim/bullets.vim",
    enabled = true,
    config = function()
      -- Disable deleting the last empty bullet when pressing <cr> or 'o'
      -- default = 1
      vim.g.bullets_delete_last_bullet_if_empty = 1

      -- (Optional) Add other configurations here
      -- For example, enabling/disabling mappings
      -- vim.g.bullets_set_mappings = 1
    end,
  },
}
