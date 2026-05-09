return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			-- "WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")

			-- local mason_tool_installer = require("mason-tool-installer")

			-- enable mason and configure icons
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- mason_tool_installer.setup({
			--   ensure_installed = {
			--     "prettier", -- prettier formatter
			--     "stylua",   -- lua formatter
			--     -- "standardrb", -- ruby formatter
			--     -- "rubocop", -- ruby formatter
			--     "htmlhint", -- html linter
			--   },
			-- })
		end,
	},
	{
		"dcampos/nvim-snippy",
		config = function()
			require("snippy").setup({
				mappings = {
					is = {
						["<Tab>"] = "expand_or_advance",
						["<S-Tab>"] = "previous",
					},
					-- nx = {
					--   ['<leader>x'] = 'cut_text',
					-- },
				},
			})
		end,
	},
	{

		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local lspconfig = require("lspconfig")

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							},
						},
					},
				},
			})
			vim.lsp.enable("lua_ls")

			-- vim.lsp.config("html", { capabilities = capabilities })
			-- vim.lsp.enable("html")
			-- vim.lsp.config("jsonls", { capabilities = capabilities })
			-- vim.lsp.enable("jsonls")
			vim.lsp.config("bashls", { capabilities = capabilities })
			vim.lsp.enable("bashls")
			vim.lsp.config("yamlls", { capabilities = capabilities })
			vim.lsp.enable("yamlls")

			-- vim.lsp.config("ruby_lsp", { capabilities = capabilities })
			-- vim.lsp.enable("ruby_lsp")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, { desc = "signature help" })

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})

			-- vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, { silent = true, noremap = true })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { silent = true, noremap = true })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})

			-- vim.keymap.set("n", "ff", vim.lsp.buf.format, { silent = true, noremap = true })

			-- vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, { silent = true, noremap = true })
			-- vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, { silent = true, noremap = true })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
			vim.keymap.set("n", "d[", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
			vim.keymap.set("n", "d]", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
			vim.keymap.set("n", "<leader>h", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, {})

			local cmp = require("cmp")

			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				snippet = {
					expand = function(args)
						require("snippy").expand_snippet(args.body) -- For `snippy` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					-- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
					["<C-y>"] = cmp.mapping(
						cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						}),
						{ "i", "c" }
					),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					-- { name = "copilot", group_index = 2 },
					per_filetype = {
						codecompanion = { "codecompanion" },
					},
					{ name = "nvim_lsp" },
					{ name = "snippy" }, -- For snippy users.
					{ name = "path" },
					-- { name = 'calc' },
					{ name = "treesitter" },
					{ name = "tags" },
					-- { name = 'rg' },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},

	{
		"nvim-telescope/telescope.nvim",

		-- tag = "0.1.8",

		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"AckslD/nvim-neoclip.lua",
				config = function()
					require("neoclip").setup({
						keys = {
							telescope = {
								i = {
									paste = "<cr>",
									paste_behind = "<c-p>",
								},
								n = {
									paste = "<cr>",
									paste_behind = "P",
								},
							},
						},
					})
				end,
			},
		},

		config = function()
			require("telescope").setup({

				defaults = {
					-- -- Display path without leading './'
					-- path_display = function(_, path)
					--   return path:gsub("^%./", "")
					-- end,
					mappings = {
						i = {
							-- ["<C-h>"] = "which_key",
							["<C-j>"] = "move_selection_next",
							["<C-k>"] = "move_selection_previous",
							-- ['<C-g>'] = function(prompt_bufnr)
							--   -- Use nvim-window-picker to choose the window by dynamically attaching a function
							--   local action_set = require('telescope.actions.set')
							--   local action_state = require('telescope.actions.state')
							--
							--   local picker = action_state.get_current_picker(prompt_bufnr)
							--   picker.get_selection_window = function(picker, entry)
							--     local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
							--     -- Unbind after using so next instance of the picker acts normally
							--     picker.get_selection_window = nil
							--     return picked_window_id
							--   end
							--
							--   return action_set.edit(prompt_bufnr, 'edit')
							-- end,
						},
					},
					layout_strategy = "vertical",
					anchor = "N",
					file_ignore_patterns = {
						"node_modules",
						"vcr_cassettes",
						"^vendor/",
						"package-lock.json",
						"lazy-lock.json",
					},
					path_display = { "truncate" },
					layout_config = {
						center = {
							preview_height = 0.7,
						},
						vertical = {
							prompt_position = "top",
							preview_height = 0.7,
							mirror = true,
							preview_cutoff = 4,
							width = 0.90,
							height = 0.90,
						},
						horizontal = {
							prompt_position = "top",
							preview_width = 0.7,
							width = 0.90,
							height = 0.90,
						},
					},
					sorting_strategy = "ascending",
					-- preview = true,
				},
				pickers = {
					buffers = {
						-- path_display = formattedName,
						mappings = {
							i = {
								["<C-d>"] = require("telescope.actions").delete_buffer,
							},
							n = {
								["<C-d>"] = require("telescope.actions").delete_buffer,
							},
						},
						-- previewer = false,
						-- initial_mode = "normal",
						-- -- theme = "dropdown",
						-- layout_config = {
						--   height = 0.4,
						--   width = 0.6,
						--   prompt_position = "top",
						--   preview_cutoff = 120,
						-- },
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>t", builtin.find_files, {})
			vim.keymap.set("n", "g*", builtin.grep_string, {})
			vim.keymap.set("n", "g/", builtin.live_grep, {})

			-- vim.keymap.set('n', '<leader>8', function()
			--   local word = vim.fn.expand("<cword>")
			--   builtin.grep_string({ search = word })
			-- end)
			-- vim.keymap.set('n', '<leader>*', function()
			--   local word = vim.fn.expand("<cWORD>")
			--   builtin.grep_string({ search = word })
			-- end)
			-- vim.keymap.set('n', '<leader>ps', function()
			--   builtin.grep_string({ search = vim.fn.input("Grep > ") })
			-- end)

			vim.keymap.set("n", "<leader>b", builtin.buffers, {})
			vim.keymap.set("n", "<leader>km", builtin.keymaps, {})
			vim.keymap.set("n", "<leader>gc", builtin.commands, {})
			vim.keymap.set("n", "<leader>ht", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>ef", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
			vim.keymap.set("n", "<leader>m", builtin.marks, {})
			vim.keymap.set("n", "<leader>qh", builtin.quickfixhistory, {})

			vim.keymap.set("n", "<leader>eh", "<cmd>Telescope find_files hidden=true<cr>", {})

			vim.keymap.set("n", "<leader>eb", function()
				local buffers = vim.tbl_filter(function(b)
					return vim.api.nvim_buf_is_loaded(b) and vim.bo[b].buftype == ""
				end, vim.api.nvim_list_bufs())

				local paths = vim.tbl_map(function(b)
					return vim.api.nvim_buf_get_name(b)
				end, buffers)

				builtin.live_grep({ search_dirs = paths })
			end, { desc = "grep open buffers" })

			-- local actions = require('telescope.actions')
			-- local action_state = require('telescope.actions.state')

			function live_grep_in_directory()
				local opts = {}
				local cwd = vim.fn.input("Path to directory: ", "", "dir")
				if cwd ~= "" then
					opts.cwd = cwd
				end
				require("telescope.builtin").live_grep(opts)
			end

			vim.api.nvim_set_keymap(
				"n",
				"<leader>ee",
				[[<cmd>lua live_grep_in_directory()<CR>]],
				{ noremap = true, silent = true }
			)

			require("telescope").load_extension("neoclip")
			-- Lua mapping for launching Telescope's neoclip extension
			vim.keymap.set("n", "<Leader>p", function()
				require("telescope").extensions.neoclip.default()
			end, { noremap = true, silent = true, desc = "Open Telescope neoclip" })
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})

			vim.keymap.set("n", "<leader>cl", function()
				require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
			end, { desc = "swap with next parameter" })
			vim.keymap.set("n", "<leader>ch", function()
				require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
			end, { desc = "swap with previous parameter" })
		end,

		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})
		end,
	},

	-- {
	--  "nvim-telescope/telescope-ui-select.nvim",
	-- },

	{
		"mhartington/formatter.nvim",
		event = "BufWrite",
		config = function()
			-- local util = require("formatter.util")

			vim.api.nvim_create_autocmd("BufWritePost", {
				group = vim.api.nvim_create_augroup("_formatter", { clear = true }),
				pattern = "*",
				command = "FormatWrite",
			})

			-- Provides the following commands:
			-- Format, FormatWrite, FormatLock, FormatWriteLock
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = {
					-- ruby = {
					--   function()
					--     return {
					--       exe = "rubocop",
					--       args = {
					--         "--fix-layout",
					--         "--autocorrect-all",
					--         "--stdin",
					--         util.escape_path(util.get_current_buffer_file_name()),
					--         "--format",
					--         "files",
					--         "--stderr",
					--       },
					--       stdin = true,
					--     }
					--   end,
					-- },
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					-- ["*"] = {
					-- 	require("formatter.filetypes.any").remove_trailing_whitespace, -- this breaks markdown who needs to have trailing whitespace
					-- },
				},
			})
		end,
	},

	{
		"j-hui/fidget.nvim",
		-- tag = "v1.4.5",
		-- opts = {
		-- options
		-- },
	},
	-- {
	--   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	--   config = function()
	--     require("lsp_lines").setup()
	--   end,
	-- },
	-- { "tpope/vim-rails", },
	{ "tpope/vim-bundler" },

	-- consider
	-- https://github.com/RRethy/vim-illuminate
	--
}
