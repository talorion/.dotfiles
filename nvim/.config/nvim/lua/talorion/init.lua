require("talorion.set")
require("talorion.lazy_init")


local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local TalorionGroup = augroup('Talorion', {})

-- quick blink whats been yanked
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.hl.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- removes trailing whitespace from all lines in a file right before saving it.
autocmd({"BufWritePre"}, {
    group = TalorionGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = TalorionGroup ,
    callback = function(e)
        local opts = { buffer = e.buf, remap = false }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<space>e", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})
