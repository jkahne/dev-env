return {

	-- {
	--   "stevearc/conform.nvim",
	--   event = { "BufReadPre", "BufNewFile" },
	--   opts = {},
	--   config = function()
	--     local conform = require("conform")
	--     conform.setup({
	--       formatters_by_ft = {
	--         lua = { "stylua" },
	--         -- Conform will run multiple formatters sequentially
	--         -- python  = { "isort", "black" },
	--         -- You can customize some of the format options for the filetype (:help conform.format)
	--         -- rust    = { "rustfmt", lsp_format = "fallback" },
	--         -- Conform will run the first available formatter
	--         javascript = { "prettierd", "prettier", stop_after_first = true },
	--         ruby = { "ruby-lsp", "solargraph" },
	--         ["_"] = { "trim_whitespace" },
	--       },
	--       format_on_save = {
	--         -- These options will be passed to conform.format()
	--         timeout_ms = 500,
	--         async = false,
	--         lsp_format = "fallback",
	--       },
	--     })
	--
	--     vim.keymap.set({ "n", "v" }, "<leader>ff", function()
	--       conform.format({
	--         lsp_fallback = true,
	--         async = false,
	--         timeout_ms = 500,
	--       })
	--     end, { desc = "Format file or range (in visual mode)" })
	--   end,
	-- },
}
