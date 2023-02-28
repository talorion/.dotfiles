-- Add line numbers
vim.opt.number = true
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

-- Disable Backup and Swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Whitespace stuff
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Highligt colunm 80
vim.opt.colorcolumn = "80"

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
vim.opt.updatetime = 50

-- disable Ring the bell (beep or screen flash) for error messages.
vim.opt.errorbells = false

-- Do smart autoindenting when starting a new line.
vim.opt.smartindent = true

-- enable file type detection
vim.opt.filetype = "on"

-- vim's builtin file explorer
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
