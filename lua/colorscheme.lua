local M = {}

function M.setup()
    -- Define new colors
    local colors = {
        bg = 'NONE',        -- Transparent background
        fg = '#dcdfe4',     -- Light foreground
        red = '#ff6f61',    -- Soft red
        green = '#98c379',  -- Soft green
        yellow = '#e5c07b', -- Soft yellow
        blue = '#61afef',   -- Soft blue
        purple = '#c678dd', -- Soft purple
        aqua = '#56b6c2',   -- Soft aqua
        orange = '#d19a66', -- Soft orange
        gray = '#a0a0a0',   -- Dark gray
    }

    -- Set background color
    vim.o.background = 'dark'

    -- Apply colors
    for group, color in pairs({
        Normal = { fg = colors.fg, bg = colors.bg },
        Comment = { fg = colors.gray, italic = true },
        Constant = { fg = colors.orange },
        Identifier = { fg = colors.blue },
        Statement = { fg = colors.red },
        PreProc = { fg = colors.purple },
        Type = { fg = colors.green },
        Special = { fg = colors.aqua },
        Underlined = { fg = colors.blue, underline = true },
        Error = { fg = colors.red, bg = colors.bg },
        Todo = { fg = colors.red, bg = colors.bg, bold = true, italic = true },
        -- TODO improve floating window colors
        Pmenu = { fg = colors.fg, bg = 'NONE' },
        PmenuSel = { fg = colors.fg, bg = colors.blue },
        PmenuSbar = { bg = colors.bg },
        PmenuThumb = { bg = colors.aqua },
        FloatBorder = { fg = colors.fg, bg = 'NONE' },
        NormalFloat = { fg = colors.fg, bg = 'NONE' },
    }) do
        vim.api.nvim_set_hl(0, group, color)
    end
end

return M
