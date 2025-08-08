local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
	return
end
local methods = require("null-ls.methods")
local helpers = require("null-ls.helpers")

local function ruff_fix()
	return helpers.make_builtin({
		name = "ruff",
		meta = {
			url = "https://github.com/charliermarsh/ruff/",
			description = "An extremely fast Python linter, written in Rust.",
		},
		method = methods.internal.FORMATTING,
		filetypes = { "python" },
		generator_opts = {
			command = "ruff",
			args = { "--fix", "-e", "-n", "--stdin-filename", "$FILENAME", "-" },
			to_stdin = true,
		},
		factory = helpers.formatter_factory,
	})
end
local sources = {
	-- python
	ruff_fix(),
	null_ls.builtins.diagnostics.ruff,
	-- null_ls.builtins.formatting.ruff,
	-- null_ls.builtins.formatting.isort,
	-- null_ls.builtins.formatting.black.with({
	--   extra_args = { "--line-length=120" }
	-- }),
	-- null_ls.builtins.formatting.black,
	-- null_ls.builtins.formatting.autoflake.with({
	--     extra_args ={ "--remove-all-unused-imports", "--ignore-init-module-imports" }
	-- }),
	-- null_ls.builtins.formatting.autoflake,

	-- lua
	null_ls.builtins.formatting.stylua,

	-- cpp, c, cs, java, cuda
	null_ls.builtins.formatting.clang_format,

	-- rust
	-- null_ls.builtins.formatting.rustfmt,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					-- vim.lsp.buf.formatting_sync()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})
