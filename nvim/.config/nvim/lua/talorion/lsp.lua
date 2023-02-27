local opts = { noremap=true, silent=true }
-- show diagnostics in a floating window
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- Move to the previous diagnostic
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- Move to the next diagnostic
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

   -- Mappings.
   -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- Jump to the definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- Displays hover information about the symbol under the cursorvim
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- Lists all the implementations for the symbol under the cursor
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- Displays a function's signature information
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--   vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--   vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--   vim.keymap.set('n', '<space>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, bufopts)
--   vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--   vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--   vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--   vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
-- 
local lsp_flags = {
   -- This is the default in Nvim 0.7+
   debounce_text_changes = 150,
}
require("lspconfig").pyright.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["python"] = {
          ["analysis"] = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true
          }
      }
    }
}

require("lspconfig").cmake.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    init_options = {
        ["buildDirectory"] = "build"
    }
}

require("lspconfig").clangd.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    cmd = {"clangd-12"}
}
