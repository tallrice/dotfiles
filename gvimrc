" silent! colorscheme solarized
" call togglebg#map("<F2>")
set background=dark
silent! colorscheme molokaiMichael
" silent! colorscheme Apprentice
let g:airline_theme='molokai'
autocmd VimEnter *
   \ let g:airline#themes#molokai#palette.tabline = {
   \    'airline_tabmod_unsel': ['#f8f8f8','#780000',231,88,''],
   \ } | :AirlineRefresh
   " \ let g:airline#themes#molokai#palette.tabline = {
   " \    'airline_tabmod':       ['#f8f8f8','#780000',231,88,''],
   " \    'airline_tabmod_unsel': ['#dddddd','#463030',231,52,''],
   " \ } | :AirlineRefresh
hi SpecialKey cterm=NONE  ctermfg=1  ctermbg=0  guifg=#dc322f guibg=NONE  gui=NONE
hi Conceal ctermfg=4 guifg=#586e75 guibg=NONE gui=NONE
hi Statement gui=none
hi StatusLine gui=none,reverse
hi Keyword gui=none
" hi Exceptions gui=none
" hi javaExceptions gui=none
if has("gui_macvim")
    set undodir=~/vim/vimundo/
elseif has("gui_win32")
    set undodir=~/vimfiles/vimundo/
    " Maximize screen size at startup
    " sim[alt] {key}: simulate pressing {key} while holding Alt pressed.
    " ~ is used by simalt to represent the <Space> character. >
    au GUIEnter * simalt ~x
endif
"set guifont=LetterGothicMono:h18
"set guifont=Fixedsys:h11:cANSI
" set guifont=LucidaConsole:h18
set guifont=Source\ Code\ Pro:h18

" deprecated in favor of https://github.com/ap/vim-css-color
" if exists('*HexHighlight()')
"   " http://www.vim.org/scripts/script.php?script_id=2937
"   nmap <leader>h :call HexHighlight()<Return>
" endif

set guioptions-=T
" Do not use modal alert dialogs! (Prefer Vim style prompt.)
" http://stackoverflow.com/questions/4193654/using-vim-warning-style-in-gvim
set guioptions+=rc
" Do not use Aqua scrollbars
"set guioptions-=rL
set guioptions-=L

" " Enable CursorLine
" set cursorline
" " Default Colors for CursorLine
" highlight  CursorLine guibg=Yellow ctermbg=Yellow ctermfg=None
" " Change Color when entering Insert Mode
" autocmd InsertEnter * highlight  CursorLine guibg=Green ctermbg=Green ctermfg=Red
" " Revert Color to default when leaving Insert Mode
" autocmd InsertLeave * highlight  CursorLine guibg=Yellow ctermbg=Yellow ctermfg=None
