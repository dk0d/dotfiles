local neural = [[
  ..        ..       ..                     
..    .......                   
............
..    .......                   
  ..        ..       ..                     

[ d3c.ai ] 
]]

local neovim = [[
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████


[ d3c.ai ] 
]]

return {
	{
		"nvimdev/dashboard-nvim",
		event="VimEnter",
		opts = function()
			local logo = string.rep("\n", 16) .. neovim .. "\n\n"
			local get_icon = require("astroui").get_icon
			local opts = {
				theme = "doom",
				hide = {
					-- disable this if using lualine
					-- enabling this messes up the actual laststatus setting after loading a file
					statusline = true,
				},
				config = {
					header = vim.split(logo, "\n"),
					center = {
						{
							action = "Telescope find_files",
							desc = " Find file",
							icon = get_icon("Search", 2, true),
							key = "LDR f f",
						},
						{
							action = "ene | startinsert",
							desc = " New file",
							icon = get_icon("FileNew", 2, true),
							key = "LDR n  ",
						},
						{
							action = "Telescope oldfiles",
							desc = " Recent files",
							icon = get_icon("DefaultFile", 2, true),
							key = "LDR f O",
						},
						{
							action = "Telescope live_grep",
							desc = " Find text",
							icon = get_icon("WordFile", 2, true),
							key = "LDR f w",
						},
						{
							action = "Telescope marks",
							desc = " Bookmarks",
							icon = get_icon("Bookmarks", 2, true),
							key = "LDR f '",
						},
						{
							action = 'lua require("persistence").load()',
							desc = " Restore Session",
							icon = get_icon("Session", 2, true),
							key = "LDR S .",
						},
					},
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return {
							"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
						}
					end,
				},
			}

			for _, button in ipairs(opts.config.center) do
				button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
				button.key_format = "  %s"
			end

			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "DashboardLoaded",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			return opts
		end,
	},

	{
		{
			"goolord/alpha-nvim",
			enabled = false,
			opts = function()
				local dashboard = require("alpha.themes.dashboard")
				local get_icon = require("astroui").get_icon
				dashboard.section.header.val = vim.split(brain, "\n", { trimempty = true })
				dashboard.section.buttons.val = {
					dashboard.button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
					dashboard.button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
					dashboard.button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
					dashboard.button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
					dashboard.button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
					-- dashboard.button('LDR S l', get_icon('Refresh', 2, true) .. 'Last Session  '),
					dashboard.button("LDR S .", get_icon("Session", 2, true) .. "Last Session "),
				}
				return dashboard
			end,

			dependencies = { { "nvim-tree/nvim-web-devicons" } },
		},

		-- You can disable default plugins as follows:
		-- { "max397574/better-escape.nvim", enabled = false },
		--
		-- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
		-- {
		--   "L3MON4D3/LuaSnip",
		--   config = function(plugin, opts)
		--     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
		--     -- add more custom luasnip configuration such as filetype extend or custom snippets
		--     local luasnip = require "luasnip"
		--     luasnip.filetype_extend("javascript", { "javascriptreact" })
		--   end,
		-- },
		-- {
		--   "windwp/nvim-autopairs",
		--   config = function(plugin, opts)
		--     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
		--     -- add more custom autopairs configuration such as custom rules
		--     local npairs = require "nvim-autopairs"
		--     local Rule = require "nvim-autopairs.rule"
		--     local cond = require "nvim-autopairs.conds"
		--     npairs.add_rules(
		--       {
		--         Rule("$", "$", { "tex", "latex" })
		--           -- don't add a pair if the next character is %
		--           :with_pair(cond.not_after_regex "%%")
		--           -- don't add a pair if  the previous character is xxx
		--           :with_pair(
		--             cond.not_before_regex("xxx", 3)
		--           )
		--           -- don't move right when repeat character
		--           :with_move(cond.none())
		--           -- don't delete if the next character is xx
		--           :with_del(cond.not_after_regex "xx")
		--           -- disable adding a newline when you press <cr>
		--           :with_cr(cond.none()),
		--       },
		--       -- disable for .vim files, but it work for another filetypes
		--       Rule("a", "a", "-vim")
		--     )
		--   end,
		-- },
		-- By adding to the which-key config and using our helper function you can add more which-key registered bindings
		-- {
		--   "folke/which-key.nvim",
		--   config = function(plugin, opts)
		--     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
		--     -- Add bindings which show up as group name
		--     local wk = require "which-key"
		--     wk.register({
		--       b = { name = "Buffer" },
		--     }, { mode = "n", prefix = "<leader>" })
		--   end,
		-- },
	},
}
