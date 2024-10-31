--[[
	:help vim.opt
	:help options
	:help option-list
	:options
]] --

--[[
    options to look further:
    virtualedit
]] --

-- table to define options
local default_opts = {

    -- save undo history
    undofile = true,

    -- sets line/relative numbers (default false)
    number = true,
    relativenumber = true,

    -- highlights cursor line and column (default false)
    -- cursorline = true,
    -- cursorcolumn = true,

    -- column to the left of the numbers used to display, for example, error signs
    signcolumn = 'yes',

    -- preview substitutions as you type
    --inccommand = 'split',

    -- minimal number of lines to keep above and below the cursor
    scrolloff = 10,

    -- vim will wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen (default false)
    linebreak = true,

    -- wrapped lines preserve indenting
    breakindent = true,

    -- expands tabs into spaces
    expandtab = true,

    -- defines the number of spaces that a tab character (\t) represents
    tabstop = 4,

    -- defines the number of spaces to use for each step of (auto)indentation
    -- if set to zero falls back to the value in tabstop
    shiftwidth = 0,

    -- case insensitive searching UNLESS \C or one or more capital letters in search term
    ignorecase = true,
    smartcase = true,

    -- configures how the completion menu behaves when invoked
    completeopt = 'menu,menuone,noselect'
}

for key, value in pairs(default_opts) do
    vim.opt[key] = value
end
