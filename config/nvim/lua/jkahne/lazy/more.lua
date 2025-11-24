return {
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
				-- Old text                    Command         New text
				-- surr*ound_words             ysiw)           (surround_words)
				-- *make strings               ys$"            "make strings"
				-- [delete ar*ound me!]        ds]             delete around me!
				-- remove <b>HTML t*ags</b>    dst             remove HTML tags
				-- 'change quot*es'            cs'"            "change quotes"
				-- <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
				-- delete(functi*on calls)     dsf             function calls
			})
		end,
	},

	{ "rizzatti/dash.vim" },

	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup()
			vim.keymap.set("n", "<leader>k", function()
				require("lsp_signature").toggle_float_win()
			end, { silent = true, noremap = true, desc = "toggle signature" })
		end,
	},
	{ "kshenoy/vim-signature" },
	{
		"mhinz/vim-signify",
		init = function()
			vim.g.signify_update_on_bufenter = 1
			vim.g.signify_update_on_focusgained = 1
		end,
	},

	{
		"junegunn/vim-easy-align",
		config = function()
			vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", { noremap = false, silent = true })
			vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { noremap = false, silent = true })
		end,
	},

	{ "mg979/vim-visual-multi" },

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				{
					opts = {
						-- Defaults
						enable_close = true, -- Auto close tags
						enable_rename = true, -- Auto rename pairs of tags
						enable_close_on_slash = true, -- Auto close on trailing </
					},
					-- Also override individual filetype configs, these take priority.
					-- Empty by default, useful if one of the "opts" global settings
					-- doesn't work well in a specific filetype
					-- per_filetype = {
					--   ["html"] = {
					--     enable_close = false
					--   }
					-- }
				},
			})
		end,
	},

	-- consider using https://github.com/klen/nvim-test instead
	-- looks like you can configure to append docker commands to the test commands (see comments below 🤝)
	{
		"vim-test/vim-test",
		config = function()
			-- vim.g['test#strategy'] = 'basic'
			-- vim.g["test#strategy"] = "neovim_sticky"
			-- vim.g["test#strategy"] = "vimux"

			vim.keymap.set(
				"n",
				"<Leader>sa",
				":TestSuite<CR>",
				{ noremap = true, silent = true, desc = "Run Test Suite" }
			)
			vim.keymap.set(
				"n",
				"<Leader>sf",
				":TestFile<CR>",
				{ noremap = true, silent = true, desc = "Run Test File" }
			)
			vim.keymap.set(
				"n",
				"<Leader>ss",
				":TestNearest<CR>",
				{ noremap = true, silent = true, desc = "Run Nearest Test" }
			)
			vim.keymap.set(
				"n",
				"<Leader>sl",
				":TestLast<CR>",
				{ noremap = true, silent = true, desc = "Run Last Test" }
			)
			vim.keymap.set(
				"n",
				"<Leader>sv",
				":TestVisit<CR>",
				{ noremap = true, silent = true, desc = "Visit Test File" }

				-- vim.cmd("let test#strategy = 'vimux'")
			)
		end,
	},
	-- comment 🤝 here
	-- This is code taken from https://gitlab.com/oinak/dot_config_nvim/-/blob/main/lua/plugins/languages.lua?ref_type=heads
	-- I have not tried this yet
	--  {
	--   'klen/nvim-test', -- run tests from nvim
	--   dependencies = { "nvim-treesitter/nvim-treesitter", },
	--   config = function()
	--     require('nvim-test').setup({
	--       termOpts = {
	--         direction = "horizontal", -- terminal's direction ("horizontal"|"vertical"|"float")
	--       },
	--     })
	--
	--     require('nvim-test.runners.rspec'):setup({
	--       command = 'docker-compose',
	--       args = { "exec", "web", "bundle", "exec", "rspec" },
	--       file_pattern = "\\v(spec_[^.]+|[^.]+_spec)\\.rb$",
	--       find_files = { "{name}_spec.rb" },
	--     })
	--
	--     vim.keymap.set("n", "<leader>tn", vim.cmd.TestNearest, { desc = '[T]est [N]earest' })
	--     vim.keymap.set("n", "<leader>tf", vim.cmd.TestFile, { desc = '[T]est [F]ile' })
	--     vim.keymap.set("n", "<leader>ts", vim.cmd.TestSuite, { desc = '[T]est [S]uite' })
	--     vim.keymap.set("n", "<leader>tl", vim.cmd.TestLast, { desc = '[T]est [L]ast' })
	--     vim.keymap.set("n", "<leader>tv", vim.cmd.TestVisit, { desc = '[T]est [V]isit' })
	--   end,
	-- },

	{
		"szw/vim-maximizer",
		config = function()
			-- Set up key mapping for maximizing the current split window
			vim.keymap.set(
				"n",
				"<C-w>m",
				":MaximizerToggle!<CR>",
				{ noremap = true, silent = true, desc = "Toggle maximize current split" }
			)
		end,
	},

	-- {
	--   'numToStr/Comment.nvim',
	--   opts = {
	--     -- add any options here
	--   },
	--   lazy = false,
	--   config = function()
	--     require('Comment').setup({})
	--   end
	-- },

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},

	{
		"kevinhwang91/nvim-bqf", -- better quickfix
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		build = ":TSUpdate",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>cn", ":cnext<cr>", {})
			vim.api.nvim_set_keymap("n", "<leader>cp", ":cprevious<cr>", {})
		end,
	},
}
