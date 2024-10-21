--[[
	:help vim.opt
	:help options
	:help option-list
]]--

-- table to define options
local default_opts = {

	-- wrapped lines preserve indenting
	breakindent = true,
	-- sets line/relative numbers (default false)
	number = true,
	relativenumber = true,
	-- highlights cursor line and column (default false)
	cursorline = true,
	cursorcolumn = false,
	
}

for key, value in pairs(default_opts) do
	vim.opt[key] = value
end
