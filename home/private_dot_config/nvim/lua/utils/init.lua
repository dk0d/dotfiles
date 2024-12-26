local M = {}

M.path_exists = function(filename)
	local stat = vim.loop.fs_stat(filename)
	return stat and stat.type or false
end
M.is_dir = function(filename)
	return M.path_exists(filename) == "directory"
end
M.is_file = function(filename)
	return M.path_exists(filename) == "file"
end
M.is_empty = function(s)
	return s == nil or s == ""
end

M.get_python = function()
	if not M.is_empty(os.getenv("VIRTUAL_ENV")) then
		return os.getenv("VIRTUAL_ENV") .. "/bin/python"
	elseif not M.is_empty(os.getenv("CONDA_PREFIX")) then
		return os.getenv("CONDA_PREFIX") .. "/bin/python"
	else
		return "python"
	end
end

M.get_provider_python = function()
	if not M.is_empty(os.getenv("CONDA_PYTHON_EXE")) then
		local CONDA_PYTHON_EXE = os.getenv("CONDA_PYTHON_EXE")
		if CONDA_PYTHON_EXE and vim.startswith(CONDA_PYTHON_EXE, "/apps") then
			return M.get_python()
		end
		return os.getenv("CONDA_PYTHON_EXE")
	elseif not M.is_empty(os.getenv("VIRTUAL_ENV")) then
		return os.getenv("VIRTUAL_ENV") .. "/bin/python"
	else
		return "python"
	end
end

---@param name string
---@param fn fun(name:string)
function M.on_load(name, fn)
	local Config = require("lazy.core.config")
	if Config.plugins[name] and Config.plugins[name]._.loaded then
		fn(name)
	else
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyLoad",
			callback = function(event)
				if event.data == name then
					fn(name)
					return true
				end
			end,
		})
	end
end

M.P = function(v)
	print(vim.inspect(v))
	return v
end

M.RELOAD = function(...)
	local m = require("plenary.reload").reload_module(...)
	return m
end

M.R = function(name)
	M.RELOAD(name)
	return require(name)
end

--- Open a URL under the cursor with the current operating system (Supports Mac OS X and *nix)
-- @param path the path of the file to open with the system opener
M.SystemOpen = function(path)
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

return M
