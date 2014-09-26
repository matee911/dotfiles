"Plugins in Vim are files that you drop in subdirectories of your .vim/ directory.
"Many plugins exist of only a single file that should be dropped in .vim/plugin,
"but some exist of multiple files. For example, they come with documentation,
"or ship syntax files. In those cases, files need to be dropped into .vim/doc and .vim/syntax.
"This makes it difficult to remove the plugin afterwards.
"After installing pathogen, you can simply unzip a plugin distribution into .vim/bundle/myplugin,
"under which the required subdirectories are created.
"Removing the plugin, then, is as simple as removing the myplugin directory.

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#incubate()
execute pathogen#infect()

" <Leader> definition
" change the mapleader from \ to <space>
let mapleader=" "

" Basic
set nocompatible
set encoding=utf-8
set showcmd
set noswapfile
set nobackup
syntax enable
filetype plugin indent on

"" Whitespace
set nowrap                                            " don't wrap lines
set tabstop=2                                         " a tab is two spaces
set shiftwidth=2                                      " number of spaces to use for autoindenting
set shiftround                                        " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab
set backspace=indent,eol,start                        " allow backspacing over everything in insert mode
set autoindent                                        " always set autoindenting on
set copyindent                                        " copy the previous indentation on autoindenting
set list
set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮,nbsp:•    " highlight whitespaces
set pastetoggle=<F2>                                  " pasting large amounts of text into vim

" change : to ; (;w without pressing shift key
nnoremap ; :

" No pain no gain
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Use shift-H and shift-L for move to beginning/end
nnoremap H 0
nnoremap L $

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Higlight with *, undo with ,/
nmap <silent> ,/ :nohlsearch<CR>

" Did you forgot to open file with sudo?  ;w!! to the rescue
cmap w!! w !sudo tee % >/dev/null


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"" NerdTree
let NERDTreeShowHidden = 1
let NERDTreeIgnore=['\.pyc$', '\.pyo$']
" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1
" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1
nmap <Leader>d :NERDTreeToggle<CR>

"" Ostatnio otwierane pliki
nmap <Leader>o :CtrlPMRUFiles<CR>


"" Searching
set hlsearch                                            " highlight search terms
set incsearch                                           " show search matches as you type
set ignorecase                                          " ignore case when searching
set smartcase                                           " insert tabs on the start of a line according to
                                                        " shiftwidth, not tabstop

"" Visual stuff
set number                                              " always show line numbers
set showmatch                                           " set show matching parenthesis
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


"" Ack for the word under cursor
"nnoremap <leader>a :Ack<Space>
nnoremap <leader>a :Ack!<Space><c-r><c-W>


"" Removes trailing spaces
function! TrimWhiteSpace() "{{{
    let cursor_pos = getpos('.')
    silent! %s/\s\+$//
    call setpos('.', cursor_pos)
endfunction "}}}

"" Strip all trailing whitespace from a file, using ,W
" nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>

command Rtw :call TrimWhiteSpace()
nnoremap <silent> <Leader>rtw :call TrimWhiteSpace()<CR>
"" autocmd BufWritePre * :call TrimWhiteSpace()
"" Automatyczne trimowanie spacji przy zapisywaniu .py, .go, .rst, .html
autocmd BufWritePre *.go :call TrimWhiteSpace()
autocmd BufWritePre *.html :call TrimWhiteSpace()
autocmd BufWritePre *.py :call TrimWhiteSpace()
autocmd BufWritePre *.rst :call TrimWhiteSpace()

""" -------- Ctags
"" brew install --HEAD ctags (--HEAD poniewaz na chwile obecna formula instaluje wersje 5.8 bez wsparcia dla go)
"" Poniewaz
"" /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ctags
"" jest malo kompatybilne
""" tags file
set tags=.tags

map <F8> :!/usr/local/Cellar/ctags/5.8/bin/ctags -f .tags --verbose=no --recurse=yes --exclude=tmp --exclude=__pycache__ --exclude=.tox --exclude=htmlcov --totals=yes --fields=zK . <cr>
""map <leader><F8> :!/usr/local/Cellar/ctags/5.8/bin/ctags -f .tags --verbose=no --recurse=yes --exclude=tmp --exclude=__pycache__ --exclude=.tox --exclude=htmlcov --totals=yes --fields=zK .
"" /usr/local/Cellar/ctags/5.8/bin/ctags -f tags --verbose=yes --recurse=yes --exclude=tmp,.tox --fields=zK . <cr>
"" map <F8> :!/usr/local/Cellar/ctags/5.8/bin/ctags -f .tags --languages=HTML,Java,JavaScript,Python,Ruby --totals --verbose=no --recurse=yes --exclude=tmp --fields=zK . <cr>
"" au FileType python map <F8> :!ctags -f .tags --languages=Python --verbose=no --totals --recurse=yes --exclude=tmp . <cr>
"" au FileType python map <F8> :!/usr/local/Cellar/ctags/5.8/bin/ctags -f ._tags --languages=Python --verbose=no --totals --recurse=yes --exclude=tmp --fields=zK .;fgrep -v kind:variable ._tags >.tags;rm ._tags<cr>
"" au FileType ruby map <F8> :!/usr/local/Cellar/ctags/5.8/bin/ctags -f .tags --languages=Ruby --langmap=Ruby:.rb.thor --verbose=no --totals --recurse=yes --exclude=tmp --fields=zK . <cr>

map <F5> :CtrlPTag<CR>
"" using <ctrl>+] makes it possible to jump to the declaration of the token under the cursor


" syntastic
" uzyj ,L dla pylinta, ,l dla call Flake8 ,C-l dla SyntasticCheck
nmap <leader><C-l> :SyntasticCheck<Cr>
let g:syntastic_check_on_wq=0
" let g:syntastic_quiet_warnings=0
let g:syntastic_quiet_messages = {'level': 'info'}
let g:syntastic_mode_map = { 'mode': 'active' }
" tylko flake8 bo jest duzo duzo szybszy (dzieki pyflakes niz pylint)
let g:syntastic_python_checkers = ['python', 'flake8']
" let g:syntastic_python_flake8_args="--config=setup.cfg"



command Dark :colorscheme desert
command Light :colorscheme summerfruit256


"" TODO: uporzadkowac
au BufRead,BufNewFile *.md set filetype=markdown

" set macmeta " Allow use of Option key as meta key (for M-x bindings)
set fu " Start fullscreen
