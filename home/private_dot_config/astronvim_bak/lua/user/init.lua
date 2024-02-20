-- Global flag to configure for colemak layout
vim.g.use_colemak = false

function IsEmpty(s)
	return s == nil or s == ""
end

-- function Exists(s) return vim.fn.exists(s) end

function GetPython()
	if not IsEmpty(os.getenv("CONDA_PREFIX")) then
		return os.getenv("CONDA_PREFIX") .. "/bin/python"
	elseif not IsEmpty(os.getenv("VIRTUAL_ENV")) then
		return os.getenv("VIRTUAL_ENV") .. "/bin/python"
	else
		return "python"
	end
end

function GetProviderPython()
	if not IsEmpty(os.getenv("CONDA_PYTHON_EXE")) then
		if vim.startswith(os.getenv("CONDA_PYTHON_EXE"), "/apps") then
			return GetPython()
		end
		return os.getenv("CONDA_PYTHON_EXE")
	elseif not IsEmpty(os.getenv("VIRTUAL_ENV")) then
		return os.getenv("VIRTUAL_ENV") .. "/bin/python"
	else
		return "python"
	end
end

P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	local m = require("plenary.reload").reload_module(...)
	return m
end

R = function(name)
	RELOAD(name)
	return require(name)
end

--- Open a URL under the cursor with the current operating system (Supports Mac OS X and *nix)
-- @param path the path of the file to open with the system opener
function SystemOpen(path)
	path = path or vim.fn.expand("<cfile>")
	if vim.fn.has("mac") == 1 then
		-- if mac use the open command
		vim.fn.jobstart({ "open", path }, { detach = true })
	elseif vim.fn.has("unix") == 1 then
		-- if unix then use xdg-open
		vim.fn.jobstart({ "xdg-open", path }, { detach = true })
	else
		-- if any other operating system notify the user that there is currently no support
		vim.notify("System open is not supported on this OS!", "error")
	end
end

local swift_lsp = vim.api.nvim_create_augroup("swift_lsp", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "swift" },
	callback = function()
		local root_dir = vim.fs.dirname(vim.fs.find({
			"Package.swift",
			".git",
		}, { upward = true })[1])
		local client = vim.lsp.start({
			name = "sourcekit-lsp",
			cmd = { "sourcekit-lsp" },
			root_dir = root_dir,
		})
		vim.lsp.buf_attach_client(0, client)
	end,
	group = swift_lsp,
})

-- MDX files
vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
	filename = {},
	pattern = {},
})

-- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
-- ft_to_parser.mdx = "markdown"

return {
	-- Configure AstroNvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "stable", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "nightly", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_quit = false, -- automatically quit the current session after a successful update
		remotes = { -- easily add new remotes to track
			--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
			--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
			--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		},
	},
	-- Set colorscheme to use
	-- colorscheme = "kanagawa-dragon",
	colorscheme = 'kanagawa-wave',
	-- colorscheme = "catppuccin-mocha",
	-- colorscheme = 'onedark',

	-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on

	diagnostics = {
		virtual_text = true,
		underline = true,
	},
	highlights = {
		-- set highlights for all themes
	},
	lsp = {
		-- customize lsp formatting options
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = false, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					-- "go",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					-- "python",
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- "sumneko_lua",
			},
			timeout_ms = 1000, -- default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--   return true
			-- end
		},
		-- enable servers that you already have installed without mason
		servers = {
			-- "pyright"
		},
	},
	-- Configure require("lazy").setup() options
	lazy = {
		defaults = { lazy = true },
		performance = {
			rtp = {
				-- customize default disabled vim plugins
				disabled_plugins = {
					"tohtml",
					"gzip",
					"matchit",
					"zipPlugin",
					"netrwPlugin",
					"tarPlugin",
					"matchparen",
				},
			},
		},
	},
	-- This function is run last and is a good place to configuring
	-- augroups/autocommands and custom filetypes also this just pure lua so
	-- anything that doesn't fit in the normal config locations above can go here
	polish = function()
		-- Set up custom filetypes
		-- vim.filetype.add {
		--   extension = {
		--     foo = "fooscript",
		--   },
		--   filename = {
		--     ["Foofile"] = "fooscript",
		--   },
		--   pattern = {
		--     ["~/%.config/foo/.*"] = "fooscript",
		--   },
		-- }
	end,
}
