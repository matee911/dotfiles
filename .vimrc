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

"" Relative line number
"" d5k (up); indent 10lines 10>>
set relativenumber


" No annoying sound on errors
" set noerrorbells
" set novisualbell
" set t_vb=
" set tm=500


"" NerdTree
let NERDTreeShowHidden = 1
let NERDTreeIgnore=['\.pyc$', '\.pyo$']
" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1
" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

"" Ostatnio otwierane pliki
let g:ctrlp_mruf_max = 10
" Set this to 1 to show only MRU files in the current working directory
let g:ctrlp_mruf_relative = 1


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
" Set 7 lines to the cursor - when moving vertically using j/k
set so=2


"" Time out on key codes but not mappings.
"" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=100


"" CtrlP
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|htmlcov\|vendor\|node_modules$\|target$\|project$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.log$\|\.pyc$\|\.tags$',
      \ }
let g:ctrlp_follow_symlinks = 1


"" Removes trailing spaces
function! TrimWhiteSpace() "{{{
    let cursor_pos = getpos('.')
    silent! %s/\s\+$//
    call setpos('.', cursor_pos)
endfunction "}}}

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
"" tags file
set tags=.tags


"" using Ctrl-] makes it possible to jump to the declaration of the token under the cursor
"" Ctrl-t to climb back up the tree.
"" You can also go directly to a tag’s definition by entering one of the following in vim’s command mode:
"" :tag function_name
"" :ta function_name
"" :tag /^asserts_*
"" :ts or :tselect shows the list
"" :tn or :tnext goes to the next tag in that list
"" :tp or :tprev goes to the previous tag in that list
"" :tf or :tfirst goes to the first tag of the list
"" :tl or :tlast goes to the last tag of the list
"" To show the tags you’ve traversed since you opened vim, run :tags.

"" au FileType python map <F8> :!ctags -f .tags --languages=Python --verbose=no --totals --recurse=yes --exclude=tmp . <cr>
"" au FileType python map <F8> :!/usr/local/Cellar/ctags/5.8/bin/ctags -f ._tags --languages=Python --verbose=no --totals --recurse=yes --exclude=tmp --fields=zK .;fgrep -v kind:variable ._tags >.tags;rm ._tags<cr>
"" au FileType ruby map <F8> :!/usr/local/Cellar/ctags/5.8/bin/ctags -f .tags --languages=Ruby --langmap=Ruby:.rb.thor --verbose=no --totals --recurse=yes --exclude=tmp --fields=zK . <cr>


" syntastic
let g:syntastic_check_on_wq=1
" let g:syntastic_quiet_warnings=0
let g:syntastic_quiet_messages = {'level': 'info'}
let g:syntastic_mode_map = { 'mode': 'active' }
" tylko flake8 bo jest duzo duzo szybszy (dzieki pyflakes niz pylint)
let g:syntastic_python_checkers = ['python', 'flake8']
" python -m flake8
" let g:syntastic_python_flake8_args="--config=setup.cfg"


"" TODO: uporzadkowac
au BufRead,BufNewFile *.md set filetype=markdown

"
"
"
" Autocompletion   ctrl+n
"
"
"

"" Make Airline visible all the time
set laststatus=2
let g:airline#extensions#hunks#enabled = 1
"" https://github.com/airblade/vim-gitgutter
"" :GitGutterEnable
"" TODO:
"" patch color scheme   let g:airline_theme_patch_func = 'AirlineThemePatch'
"" function! AirlineThemePatch(palette)
""    if g:airline_theme == 'badwolf'
""      for colors in values(a:palette.inactive)
""        let colors[3] = 245
""      endfor
""    endif
""  endfunction


"" ignore whitespaces
let g:gitgutter_diff_args = '-w'
let g:gitgutter_sign_column_always = 1
"" :GitGutterEnable
"" :GitGutterSignsEnable



" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L



"""""""""""""""""""
"" Filetypes
"""""""""""""""""""
au BufRead,BufNewFile cloud-config setfiletype yaml


"""""""""""""""""""
"" Commands
"""""""""""""""""""

command Dark :colorscheme desert | AirlineTheme zenburn
command Light :colorscheme summerfruit256 | AirlineTheme base16
"" :AirlineTheme base16 | light | silver
"" :AirlineTheme dark | jellybeans | kolor | laederon | lucius | molokai |
"" monochrome | murmur | raven! | zenburn
"" Dark

"" command Rtw :call TrimWhiteSpace()


"""""""""""""""""""
"" Mappings
"""""""""""""""""""

" change : to ; (;w without pressing shift key
nnoremap ; :

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" No pain no gain
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Use shift-H and shift-L for move to beginning/end
nnoremap H 0
nnoremap L $

" Remap VIM 0 to first non-blank character
map 0 ^

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Higlight with *, undo with ,/
nmap <silent> ,/ :nohlsearch<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Did you forgot to open file with sudo?  ;w!! to the rescue
cmap w!! w !sudo tee % >/dev/null

nmap <Leader>d :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>
" Ostatnio otwierane pliki
nmap <Leader>o :CtrlPMRUFiles<CR>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"" Ack for the word under cursor
"nnoremap <leader>a :Ack<Space>
" nnoremap <leader>a :Ack!<Space><Space><c-r><c-W>
autocmd FileType python map <leader>a :Ack!<Space>--python<Space><c-r><c-W>

nnoremap <silent> <Leader>rtw :call TrimWhiteSpace()<CR>

"" F8 to (re)generate tags
map <F8> :!/usr/local/Cellar/ctags/5.8/bin/ctags -f .tags --verbose=no --recurse=yes --exclude=tmp --exclude=__pycache__ --exclude=.tox --exclude=htmlcov --totals=yes --fields=zK . <cr>
"" Tags list
"" map <F5> :CtrlPTag<CR>
nnoremap <leader>. :CtrlPTag<cr>
"" CtrlPBufTag

" uzyj ,L dla pylinta, ,l dla call Flake8 ,C-l dla SyntasticCheck
nmap <leader><C-l> :SyntasticCheck<CR>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" set macmeta " Allow use of Option key as meta key (for M-x bindings)
"" or...
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif



nmap <Leader>t :TagbarToggle<CR>
