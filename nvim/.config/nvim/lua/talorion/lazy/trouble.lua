-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
            })

        vim.keymap.set("n", "<leader>tt", function()
            require("trouble").toggle()
        end)

        end
    },
}
