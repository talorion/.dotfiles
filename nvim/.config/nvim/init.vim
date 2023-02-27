
let g:python3_host_prog = '/usr/bin/python3'

" vim-plug A minimalist Vim plugin manager.
call plug#begin('~/.vim/plugged')

" A nvim lua library used in other plugins
Plug 'nvim-lua/plenary.nvim'
" telescope.nvim is a highly extendable fuzzy finder over lists.
Plug 'nvim-telescope/telescope.nvim'
" collection of common configurations for Neovim's builtin language server client
Plug 'neovim/nvim-lspconfig'
" nvim-cmp source for neovim's builtin language server
Plug 'hrsh7th/cmp-nvim-lsp'
" nvim-cmp source for buffer words.
Plug 'hrsh7th/cmp-buffer'
" A compltetion engine plugin for neovim written in lua
Plug 'hrsh7th/nvim-cmp'
" Tabnine source for hrsh7th/nvim-cmp
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
" This tiny plugin adds vscode-like pictograms to neovim's builtin lsp
Plug 'onsails/lspkind-nvim'
" Repo to hold a bunch of info & extension callbacks for buildin LSP
Plug 'nvim-lua/lsp_extensions.nvim'
" This is a Vim plugin that provides Rust file detection, syntax highlighting, formatting, Syntastic integration, and more.
Plug 'rust-lang/rust.vim'
" one stop shop for vim colorschemes.
Plug 'flazz/vim-colorschemes'
" Tree-sitter is a parser generator tool and an incremental parsing library.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" A (Neo)vim plugin for formatting code.
Plug 'sbdchd/neoformat'
" nvim-dap is a Debug Adapter Protocol client implementation
Plug 'mfussenegger/nvim-dap'
" DAP Buddy allows you to manage debuggers provided by nvim-dap
Plug 'Pocco81/DAPInstall.nvim'
" Snippets collection for a set of different programming languages
Plug 'rafamadriz/friendly-snippets'
" Fugitive is the primier VIM plugin for Git
Plug 'tpope/vim-fugitive'
" A git commit browser
Plug 'junegunn/gv.vim'

" terraform support
Plug 'hashivim/vim-terraform'

" Black is the uncompromising Python code formatter.
" Plug 'ambv/black'

call plug#end()

" set colorscheme
colorscheme gruvbox 

" Add line numbers
set number
set ruler
set cursorline
set relativenumber

" Disable Backup and Swap files
set noswapfile
set nobackup
set nowritebackup

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set list listchars=tab:\›\ ,trail:-,extends:>,precedes:<,eol:¬,space:·

" Highligt colunm 80
set colorcolumn=80

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" disable blinking for the n-v-c modes
set guicursor=

" disable Ring the bell (beep or screen flash) for error messages.
set noerrorbells

" Do smart autoindenting when starting a new line.
set smartindent

" directory for undo files
set undodir=~/.vim/undodir
set undofile

" enable file type detection
set filetype=on

" 
set winbar=%=%m\ %f

"
set spell spelllang=en_us

" vim's builtin file explorer
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

" CTRL+c keys are mapped to Escaping out of insert mode
inoremap <C-c> <esc>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" load lua/talorion/init.lua:
lua require("talorion")

" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

autocmd Filetype cmake setlocal omnifunc=v:lua.vim.lsp.omnifunc

" quick blink whats been yanked
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
