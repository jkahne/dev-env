return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "git", ":Git ")
      -- vim.keymap.set("n", "gb",  ":Git blame<CR>")
      -- vim.keymap.set("n", "gap", ":Git add -p<CR>")
    end,
  },
  {
    "tpope/vim-abolish",
    -- fooBar => foo_bar  :  crs (coerce to snake_case)
    -- MixedCase (crm),
    -- camelCase (crc),
    -- UPPER_CASE (cru),
    -- dash-case (cr-),
    -- dot.case (cr.)
  },
}
