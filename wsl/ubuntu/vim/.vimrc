" Lines of history VIM remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Auto read external changes
set autoread
au FocusGained,BufEnter * checktime

" Quick saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" 7 lines using j/k
set so=7

"Show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Don't redraw while executing macros
set lazyredraw

" Enable syntax highlighting
syntax enable

set background=dark

" Set utf8 as standard encoding
set encoding=utf8

" Turn backup off
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4

" Linebreak on 100 characters
set lbr
set tw=100

" Always show the status line
set laststatus=2
