local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"rust_analyzer",
	"pyright",
})

-- Fix Undefined global 'vim'
lsp.configure("lua-language-server", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.configure("pyright", {
	settings = {
		python = {
			analysis = {
				useLibraryCodeForTypes = true,
			},
		},
	},
})

lsp.setup_nvim_cmp({
	formatting = {
		-- changing the order of fields so the icon is the first
		-- fields = {'menu', 'abbr', 'kind'},

		-- here is where the change happens
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				luasnip = "⋗",
				buffer = "Ω",
				path = "🖫",
				nvim_lua = "Π",
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "✗",
		warn = "◍",
		hint = "➜",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gi", function()
		vim.lsp.buf.implementation()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<space>e", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "gr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["lua_ls"] = { "lua" },
		["rust_analyzer"] = { "rust" },
		-- if you have a working setup with null-ls
		-- you can specify filetypes it can format.
		["null-ls"] = { "python" },
	},
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
