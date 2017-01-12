autocmd! BufWritePost
" sort start
autocmd BufWritePost .vimrc source $MYVIMRC
autocmd BufWritePost _vimrc source $MYVIMRC
autocmd Filetype java set makeprg=javac-algs4\ %
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
execute pathogen#infect()
filetype plugin indent on
let ccstate=0
let g:netrw_liststyle=3
let hlstate=0
let mapleader = ','
let prvsrc = ""
let rnustate=0
let synmatch=0
map <C-D> :call SmoothScroll(0)<Enter>
map <C-U> :call SmoothScroll(1)<Enter>
map <leader>es :sp %%
map <leader>et :tabe %%
map <leader>ev :vsp %%
map <leader>ew :e %%
" map <silent> <F10> :if ccstate == 0 \| exec "set cc=73," . join(range(86,333), ',') \| let ccstate = 1 \| echo "cc = 73, 86+" \| elseif ccstate == 1 \| exec "set cc=" . join(range(86,333), ',') \| let ccstate = 2 \| echo "cc = 86+" \| else \|set cc= \| let ccstate = 0 \| echo "Color Columns OFF" \| endif<cr>
" map <silent> <F10> :if ccstate == 1 \| set cc=9,10,11,12,13,14,15,16,25,26,27,28,29,30,31,32,41,42,43,44,45,46,47,48,57,58,59,60,61,62,63,64,73,74,75,76,77,78,79,80 \| let ccstate = 2 \| echo "cc = SMALL Field Format" \| elseif ccstate == 2 \| set cc=9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,73,74,75,76,77,78,79,80 \| let ccstate = 3 \| echo "cc = LARGE Field Format" \| elseif ccstate == 0 \| exec "set cc=" . join(range(81,333), ',') \| let ccstate = 1 \| echo "cc = 81+" \| else \|set cc= \| let ccstate = 0 \| echo "Color Columns OFF" \| endif<cr>
map <silent> <F10> :if ccstate == 0 \| exec "set cc=73," . join(range(80,333), ',') \| let ccstate = 1 \| echo "cc = 73, 80+ (72 comment limit, 79 all else)" \| elseif ccstate == 1 \| exec "set cc=" . join(range(80,333), ',') \| let ccstate = 2 \| echo "cc = 80+ (79 limit)" \| else \|set cc= \| let ccstate = 0 \| echo "Color Columns OFF" \| endif<cr>
map <silent> <F3> :if (rnustate == 0) \| set nornu \| set number \| echo "relative line numbers OFF" \| else \| set rnu \| echo "relative line numbers ON" \| endif \| let rnustate=1-rnustate<cr>
map <silent> <F4> :let newsrc = @/ \|if (hlstate == 0\|\|newsrc != prvsrc) \| nohlsearch \| let hlstate = 1 \| echo "search highlights OFF" \| else \| set hlsearch \| let hlstate = 0 \| echo "search highlights ON" \| endif \| let prvsrc = newsrc<cr>
map <silent> <F5> :make<cr>:copen<cr>
map <silent> <F6> :exec "set cc+=" . getcurpos()[2] <cr>
map <silent> <F7> :if (synmatch == 0) \|syn match WhiteSpace / / containedin=ALL conceal cchar=·\|setl conceallevel=2 concealcursor=nvi\| echo "hidden characters ON" \| else \| setl conceallevel=0 \| echo "hidden characters OFF" \| endif \|let synmatch=1-synmatch\|set list!<cr>
map <silent> <f8> :echo "cursorcolumn toggled" \| set cuc! <CR>
map <silent> <f9> :echo "cursorline toggled" \| set cul! <CR>
map <silent> <leader>qq :qa!<CR>
map <silent> <leader>ww :wqa<CR>
map j :
nmap <leader><Space> za
nmap <leader>P :pu!<CR>
nmap <leader>d :.! date<cr>
nmap <leader>f :let @* = expand("%:p")<CR>
nmap <leader>gv :tabedit $MYGVIMRC<CR>
nmap <leader>i :vert h index<CR>
nmap <leader>m :h map-overview<CR>
nmap <leader>n :let @* = expand("%")<CR>
nmap <leader>o :vert h operator<CR>
nmap <leader>p :pu<CR>
nmap <leader>pv :tabedit ~/.vim/practicalvim.vim<cr>
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <silent> <leader>sp :set spell!<cr> "Spell Checker
nnoremap & :&&<CR>
nnoremap + <C-W>+
nnoremap ? F
nnoremap F ?
nnoremap _ <C-W>-
nnoremap h <C-W><
nnoremap l <C-W>>
nnoremap qF q?
nnoremap qf q/
nnoremap t f|noremap T F
noremap / f
noremap Y y$
noremap f /
noremap qj q:
noremap s ;|noremap S ,
runtime macros/matchit.vim "tip 54, pg. 128, practical vim
set autochdir
set background=dark
set clipboard=unnamed
set cmdwinheight=41
set encoding=utf-8
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
set filetype=vim
set foldcolumn=3
set foldmethod=marker
set formatoptions+=croqlt
set hidden
set history=10000
set hls " "highlight search"
set ic " "ignorecase"
set is " [nois] "incsearch" show match for partly typed search command
set keywordprg=":help"
set laststatus=2 " See status line, even for single window
set listchars=tab:»\ ,eol:¬
set nocompatible
set nocuc "cuc
set nocul "cul
set number " Line numbers
set rnu " [nornu] "relativenumber" show the relative line number for each line
set ruler " Cursor Position
set scs " "Smartcase"
set showcmd " Show partial commands on last line
set so=5 "scrolloff
set ts=4 sw=4     sts=4 expandtab
set tw=80
set undofile
set ve=block
syntax enable
vnoremap <bs> <left>
vnoremap <leader><Space> za
xnoremap & :&&<cr>
" sort end
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
function! SmoothScroll(up)
    if a:up
        " let scrollaction=""
        let scrollaction="\<Up>"
    else
        " let scrollaction=""
        let scrollaction="\<Down>"
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 5m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction
set statusline=[%n]                             " buffer number
set statusline+=%F                              "full-path filename
" set statusline+=\ format=[%{&ff}]               "file format
set statusline+=%h                              "help file flag
set statusline+=%m                              "modified flag
set statusline+=%r                              "read only flag
" set statusline+=\ filetype=%y                   "filetype
set statusline+=\ encoding=[%{strlen(&fenc)?&fenc:'none'},
set statusline+=\ dec=\ %b,\ hex=\ 0x%B]
set statusline+=%=                              "left/right separator
set statusline+=%c,                             "cursor column
set statusline+=%l/%L                           "cursor line/total lines
" set statusline+=\ %P                            "percent through file
