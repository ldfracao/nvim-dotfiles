--[[
:help lsp
--]]

-- LUA
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'lua',
    callback = function(args)
        --  start and configure lsp behaviour
        vim.lsp.start({

            -- used internally by neovim to identify the server
            name = 'lua-language-server',

            -- a table containing the command and its arguments to start the server
            cmd = { 'lua-language-server' },

            -- defines the root directory of the project, this is where the language server will look for configuration files and other resources
            -- TODO optimize this path
            root_dir = vim.fs.root(args.buf, { 'init.lua' }),

            -- allows for projects with no root directory
            single_file_support = true,

            -- diagnostics could be declared on its own but not technically correct according to the standard LSP configuration structure
            settings = {
                Lua = {
                    runtime = {
                        version = "Lua 5.1"
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    --                   ["completion.enable"] = true
                },
            },
        })
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        print(vim.inspect(args.data))
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        print(vim.inspect(client))
        --    if client.supports_method('textDocument/implementation') then
        --      -- Create a keymap for vim.lsp.buf.implementation
        --    end
        --        print(vim.inspect(client.resolved_capabilities))
        --        print(vim.inspect(client))
        -- Enable auto-completion
        if client.supports_method('textDocument/completion') then
            vim.api.nvim_create_autocmd('TextChangedI', {
                buffer = args.buf,
                callback = function()
                    -- Trigger completion
                    vim.lsp.buf.completion()
                end,
            })
        end
        if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
            })
        end
    end,
})

-- C
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'cpp' },
    callback = function(args)
        vim.lsp.start({
            name = 'clangd',
            cmd = { 'clangd' },
            root_dir = vim.fs.root(args.buf, { 'Makefile' }),
            single_file_support = true,
        })
    end,
})
