--[[
	:help lsp
--]]

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'lua',
	callback = function(args)
    --  start and configure lsp behaviour
    vim.lsp.start({

        -- used internally by neovim to identify the server
          name = 'lua-language-server',

          -- a table containing the command and its arguments to start the server
          cmd = {'lua-language-server'},

          -- defines the root directory of the project, this is where the language server will look for configuration files and other resources
          -- TODO optimize this path
          root_dir = vim.fs.root(args.buf, { 'init.lua' }),

          -- allows for projects with no root directory
          single_file_support = true,

          -- diagnostics could be declared on its own but not technically correct according to the standard LSP configuration structure
          settings = {
              Lua = {
                  diagnostics = {
                      globals = {'vim'},
                  },
              },
          },

        })
    end,
})
