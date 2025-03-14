local M = {}

M.augroup = function(name, clear)
	vim.api.nvim_create_augroup(name, { clear = clear })
end

M.autocmd = function(event, group, pattern, cmd)
	vim.api.nvim_create_autocmd(event, {
		group = group,
		pattern = pattern,
		command = cmd,
	})
end

_G.OpenSsl = {
	open = function()
		local password = vim.fn.inputsecret("Password: ")
		vim.fn.execute(
			":'[,']!openssl enc -a -d -aes-256-cbc -md sha512 -pbkdf2 -salt -iter 100000 -pass pass:'"
				.. password
				.. "'"
		)
	end,

	save = function()
		local password = vim.fn.inputsecret("Password: ")
		vim.fn.execute(
			":'[,']!openssl enc -a -aes-256-cbc -md sha512 -pbkdf2 -salt -iter 100000 -pass pass:'" .. password .. "'"
		)
	end,
}

return M
