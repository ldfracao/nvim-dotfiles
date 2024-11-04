--[[
    :help nvim_create_autocmd
--]]

-- sets normal hightlight group background to transparent
-- must be done after a color scheme is loaded otherwise it won't persist
--vim.cmd.colorscheme('default')
--vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
