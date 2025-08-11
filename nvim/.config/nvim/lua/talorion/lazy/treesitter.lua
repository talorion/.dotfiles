return {
    -- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it
    {
        "nvim-treesitter/nvim-treesitter",

        config = function()
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all"
                ensure_installed = { "vimdoc", "javascript", "typescript", "c", "cpp", "python", "lua", "rust", "jsdoc", "bash", "go", },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
                auto_install = true,

                -- Indentation based on treesitter for the = operator
                indent = {
                    enable = true
                },

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = { "markdown" },
                },
            })
        end
    },
    -- shows the context of the currently visible buffer contents.
    {
        "nvim-treesitter/nvim-treesitter-context",
        after = "nvim-treesitter",
        config = function()
            require'treesitter-context'.setup{
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                multiwindow = false, -- Enable multiwindow support.
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            }
        end
    }
}
