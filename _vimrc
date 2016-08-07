set nocompatible
let mapleader = ','
map j :
noremap f /
noremap F ?
noremap qf q/
noremap qF q?
noremap t f|noremap T F
noremap s ;|noremap S ,
noremap qj q:
noremap Y y$
map <silent> <leader>qq :qa!<CR>
map <silent> <leader>ww :wqa<CR>
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
map <leader>es :sp %%
map <leader>et :tabe %%
map <leader>ev :vsp %%
map <leader>ew :e %%
nmap <leader><Space> za
nmap <leader>p :pu<CR>
nmap <leader>P :pu!<CR>
nmap <leader>d :.! date<cr>
nmap <leader>f :let @* = expand("%:p")<CR>
nmap <leader>gv :tabedit $MYGVIMRC<CR>
nmap <leader>i :vert h index<CR>
nmap <leader>m :h map-overview<CR>
nmap <leader>n :let @* = expand("%")<CR>
nmap <leader>o :vert h operator<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <silent> <leader>sp :set spell!<cr> "Spell Checker
nnoremap & :&&<CR>
set hidden
set background=dark
let g:netrw_liststyle=3
set clipboard=unnamed

set filetype=vim
set formatoptions+=croql
set history=10000
set hls " "highlight search"
set ic " "ignorecase"
set is " [nois] "incsearch" show match for partly typed search command
set keywordprg=":help"
set laststatus=2 " See status line, even for single window
set nolist
set number " Line numbers
set ruler " Cursor Position
set scs " "Smartcase"
set showcmd " Show partial commands on last line
set so=5 "scrolloff
set ts=4 sw=4     sts=4 expandtab
vnoremap <bs> <left>
vnoremap <leader><Space> za
let rnustate=0
let ccstate=0
let synmatch=0
let hlstate=0
let prvsrc = ""
nnoremap <silent> <F3> :if (rnustate == 0) \| set nornu \| set number \| echo "relative line numbers OFF" \| else \| set rnu \| echo "relative line numbers ON" \| endif \| let rnustate=1-rnustate<cr>
nnoremap <silent> <F4> :let newsrc = @/ \|if (hlstate == 0\|\|newsrc != prvsrc) \| nohlsearch \| let hlstate = 1 \| echo "search highlights OFF" \| else \| set hlsearch \| let hlstate = 0 \| echo "search highlights ON" \| endif \| let prvsrc = newsrc<cr>
map <silent> <F5> :ToggleSpaceHi<CR>
nnoremap <F6> :syntax sync fromstart <cr>
nnoremap <silent> <F7> :if (synmatch == 0) \|syn match WhiteSpace / / containedin=ALL conceal cchar=Â·\|setl conceallevel=2 concealcursor=nvi\| echo "hidden characters ON" \| else \| setl conceallevel=0 \| echo "hidden characters OFF" \| endif \|let synmatch=1-synmatch\|set list!<cr>
map <silent> <f8> :echo "cursorcolumn toggled" \| set cuc! <CR>
map <silent> <F9> :if ccstate == 0 \| set cc=9,10,11,12,13,14,15,16,25,26,27,28,29,30,31,32,41,42,43,44,45,46,47,48,57,58,59,60,61,62,63,64,73,74,75,76,77,78,79,80 \| let ccstate = 1 \| echo "cc = SMALL Field Format" \| elseif ccstate == 1 \| set cc=9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,73,74,75,76,77,78,79,80 \| let ccstate = 2 \| echo "cc = LARGE Field Format" \| else \|set cc= \| let ccstate = 0 \| echo "Color Columns OFF" \| endif<cr>

if version >= 703
nmap <leader>pv :tabedit ~/.vim/practicalvim.vim<cr>
runtime macros/matchit.vim "tip 54, pg. 128, practical vim
call pathogen#infect()
set cc=
set encoding=utf-8
set foldcolumn=3
set foldmethod=marker
set listchars=tab:»\ ,eol:¬
set nocuc "cuc
set nocul "cul
set rnu " [nornu] "relativenumber" show the relative line number for each line
set undofile
set ve=block
syntax enable
xnoremap & :&&<cr>
if has("autocmd")
  autocmd! BufWritePost
  autocmd BufWritePost .vimrc source $MYVIMRC
  autocmd BufWritePost _vimrc source $MYVIMRC
endif
if has('gui_running')
  set background=dark
  colo solarized
  call togglebg#map("<F2>")
  if has("gui_macvim")
    set undodir=~/.vim/vimundo/
  elseif has("gui_win32")
    set undodir=~/vimfiles/vimundo/
    " Maximize screen size at startup
    " sim[alt] {key}: simulate pressing {key} while holding Alt pressed.
    " ~ is used by simalt to represent the <Space> character. >
    au GUIEnter * simalt ~x
  endif
else
  set background=light
endif
if has("autocmd")
  filetype plugin indent on
endif
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
endif
