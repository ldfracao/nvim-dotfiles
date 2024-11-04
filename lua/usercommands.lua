-- Create the command
vim.api.nvim_create_user_command('LspInfo', function()
    -- Get active clients
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local client = clients[1]

    -- Prepare display text
    local lines = { "Active LSP clients:" }
    if #clients == 0 then
        table.insert(lines, "No active LSP clients")
    else
        table.insert(lines, string.format("- %s (id: %d)", client.name, client.id))

        -- Add server capabilities
        table.insert(lines, "  Capabilities:")
        for capability, enabled in pairs(client.server_capabilities) do
            if enabled then
                table.insert(lines, string.format("    • %s", capability))
            end
        end

        -- Add root directory
        table.insert(lines, string.format("  Root dir: %s", client.config.root_dir or "Not set"))
        table.insert(lines, "") -- Empty line between clients
    end


    -- Create buffer for floating window
    local buf = vim.api.nvim_create_buf(false, true)

    -- Calculate window size and position
    local width = 0
    for _, line in ipairs(lines) do
        width = math.max(width, #line)
    end
    local height = #lines
    local win_height = vim.api.nvim_get_option("lines")
    local win_width = vim.api.nvim_get_option("columns")

    -- Configure floating window
    local opts = {
        relative = 'editor',
        row = math.floor((win_height - height) / 2),
        col = math.floor((win_width - width) / 2),
        width = width + 2, -- Add padding
        height = height,
        style = 'minimal',
        border = 'shadow'
    }

    -- Set buffer content
    vim.api.nvim_buf_set_lines(buf, 0, -1, true, lines)

    -- Create and show the floating window
    local win = vim.api.nvim_open_win(buf, true, opts)
    -- Set buffer options
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)
    vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    -- Add keymap to close window
    vim.keymap.set('n', 'q', function()
        vim.api.nvim_win_close(win, true)
    end, { buffer = buf, noremap = true })
end, {})
