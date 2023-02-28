require("talorion.set")
require("talorion.packer")
require("talorion.remap")

local yank_group = vim.api.nvim_create_augroup('HighlightYank', {})
local fmt_group = vim.api.nvim_create_augroup('fmt', {})

-- quick blink whats been yanked
vim.api.nvim_create_autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})


-- run a formatter on save
-- vim.api.nvim_create_autocmd({"BufWritePre"}, {
--     group = TalorionGroup,
--     pattern = "*",
--     command = function()
--         vim.lsp.buf.formatting_sync()
--     end,
-- })
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = fmt_group,
    pattern = '*.py',
    callback = function()
        vim.lsp.buf.format() 
        -- vim.lsp.buf.formatting_sync()
    end
})

-- run a formatter on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
