--[[
    :help vim.keymap.set
--]]

local keymaps = {
    -- Enabling the command line can be done in different ways
    -- vim.cmd, <cmd> or :
    -- Normal mode mappings
    {'n', '<leader>pv', vim.cmd.Ex, { desc = 'Project view' }},
    {'n', '<Esc>', '<cmd>nohl<CR>', { desc = 'Clear highlights when searching' }},
    {'n', '<leader>w', vim.cmd.w, { desc = 'Save file' }},
    {'n', '<leader>s', ':so<CR>', { desc = 'Sources the current file'}},
    {'n', '<leader>qu', ':q', { desc = 'Quit neovim'}},
    {'n', '<C-d>', '<C-d>zz', { desc = 'Centers the cursor after half page down'}},
    {'n', '<C-u>', '<C-u>zz', { desc = 'Centers the cursor after half page up'}},
    {'n', '<leader>v', vim.cmd.vsp, { desc = 'Splits screen vertically'}},

    -- Insert mode mappings
    {'i', '(', '()<Esc>i', { desc = 'Auto completes parenthesis' }},
    {'i', '[', '[]<Esc>i', { desc = 'Auto completes square brackets' }},
    {'i', '{', '{}<Esc>i', { desc = 'Auto completes curly brackets' }},

    -- Multiple mode mappings
    {{'n', 'v'}, '<leader>y', '"+y', { desc = 'Yanks to plus(system clipboard) register'}},
    {{'n', 'v'}, '<leader>p', '"+p', { desc = 'Paste from plus(system clipboard) register'}},

    -- diagnostics keymaps
    {'n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics [q]uickfix list'}},
}

-- noremap (no recursive mapping) means that if the key combination you are mapping is already mapped to another command, that command will not be executed when the new mapping is triggered.
-- silent means to suppress any output that would normally be displayed in the command line when the mapping is executed.
for _, value in ipairs(keymaps) do
    vim.keymap.set(value[1], value[2], value[3], { noremap = true, silent = false })
end
