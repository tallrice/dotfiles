"set go-=T
set bg=dark

"if &background == "dark"
    "hi normal guibg=black
"endif
"set guifont=LetterGothicMono:h18
"set guifont=Fixedsys:h11:cANSI
"set guifont=Lucida_Console:h11:cANSI
set guifont=Source\ Code\ Pro:h14
silent! colorscheme solarized

if exists('*HexHighlight()')
  " http://www.vim.org/scripts/script.php?script_id=2937
  nmap <leader>h :call HexHighlight()<Return>
endif

" Do not use modal alert dialogs! (Prefer Vim style prompt.)
" http://stackoverflow.com/questions/4193654/using-vim-warning-style-in-gvim
set guioptions+=rc
" Do not use Aqua scrollbars
"set guioptions-=rL
set guioptions-=L

if has("autocmd")
  autocmd! BufWritePost     " Remove ALL autocommands for the current group.
  if has("gui_macvim")
    autocmd BufWritePost .gvimrc source $MYGVIMRC
  elseif has("gui_win32")
    autocmd BufWritePost _gvimrc source $MYGVIMRC
  endif
endif
