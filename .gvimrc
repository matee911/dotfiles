if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CtrlP<CR>
  imap <D-t> <ESC>:CtrlP<CR>
  
  "" set fu " Start fullscreen
endif
let g:ctrlp_map = ''

