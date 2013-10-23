execute pathogen#infect()

set nocompatible
syntax enable
set encoding=utf-8
set showcmd
set noswapfile
filetype plugin indent on

let mapleader=" "
let NERDTreeShowHidden = 1
nmap <Leader>d :NERDTreeToggle<CR>



"" Whitespace
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set list
set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Visual stuff
set number
set cursorline
hi CursorLine cterm=none ctermbg=none

"" Time out on key codes but not mappings.
"" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=100

colorscheme summerfruit256

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|vendor\|node_modules$\|target$\|project$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|.log$\|.pyc$',
      \ }
let g:ctrlp_follow_symlinks = 1

