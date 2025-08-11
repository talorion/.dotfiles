return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",             -- Lightweight yet powerful formatter plugin for Neovim
        "williamboman/mason.nvim",           -- Easily install and manage LSP servers
        "williamboman/mason-lspconfig.nvim", -- allow you to automatically install, and automatically enable installed servers
        "hrsh7th/cmp-nvim-lsp",              -- nvim-cmp source for neovim's built-in language server client.
        "hrsh7th/cmp-buffer",                -- nvim-cmp source for buffer words.
        "hrsh7th/cmp-path",                  -- nvim-cmp source for filesystem paths.
        "hrsh7th/cmp-cmdline",               -- nvim-cmp source for vim's cmdline.
        "hrsh7th/nvim-cmp",                  -- A completion engine plugin for neovim written in Lua
        "L3MON4D3/LuaSnip",                  -- a snippet plugin used with cmp
        "saadparwaiz1/cmp_luasnip",          -- luasnip completion source for nvim-cmp
        "j-hui/fidget.nvim",                 -- Extensible UI for Neovim notifications and LSP progress messages.
    },

    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = { "ruff" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                javascript = { "prettier"},
                rust = {"rustfmt"},
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            }

        })
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "rust_analyzer",
                "ruff",
                "clangd",
                "pyright",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
            }
        })
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-Space>"] = cmp.mapping.complete(),
                -- Accept currently selected item. If none selected, `select` first item.
                -- Set `select` to `false` to only confirm explicitly selected items.
                ["<CR>"] = cmp.mapping.confirm { select = true },
                -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })


        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end

}
