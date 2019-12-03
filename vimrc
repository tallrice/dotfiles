execute pathogen#infect()
filetype plugin indent on
syntax enable
runtime macros/matchit.vim "tip 54, pg. 128, practical vim
" ----------------------------------------------------------------------
" FUNCTIONS{{{
" ----------------------------------------------------------------------
" Control-Tab to cycle through tabs
function! TabBufNext()
" https://github.com/vim-airline/vim-airline/issues/876
    let s:tab_count = tabpagenr('$')
    if s:tab_count <= 1
        :bnext
    else
        :tabnext
    endif
endfunction

function! TabBufPrev()
    let s:tab_count = tabpagenr('$')
    if s:tab_count <= 1
        :bprev
    else
        :tabprev
    endif
endfunction
" ----------------------------------------------------------------------
" Settings for Goyo plugin
function! s:goyo_enter()
    " movement changes
    map <down> gj
    map <up> gk
    " formatting text
    setlocal formatoptions=1
    setlocal noexpandtab
    setlocal wrap
    setlocal linebreak
    " spelling and thesaurus
    setlocal spell spelllang=en_us
    set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt
    " complete+=s makes autocompletion search the thesaurus
    set complete+=s
    colorscheme pencil
    Limelight
    " set noshowmode
    " set noshowcmd
    " set scrolloff=999
    " set rnu
    " ...
endfunction
function! s:goyo_leave()
    Limelight!
    setlocal formatoptions+=tcroqnlM
    setlocal tabstop=4 shiftwidth=0 softtabstop=4 expandtab
    setlocal nowrap
    setlocal nolinebreak
    " colorscheme molokaiMichael
    so $MYGVIMRC
    " autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif | AirlineRefresh
    " let g:airline_theme='molokai'
    " hi SpecialKey cterm=NONE  ctermfg=1  ctermbg=0  guifg=#dc322f guibg=NONE  gui=NONE
    " hi Conceal ctermfg=4 guifg=#586e75 guibg=NONE gui=NONE
    " hi Statement gui=none
    " hi StatusLine gui=none,reverse
    " hi Keyword gui=none
endfunction
" ----------------------------------------------------------------------}}}
" ----------------------------------------------------------------------
" ABBREVIATIONS{{{
" ----------------------------------------------------------------------
cabbrev h tab help
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" LETTINGS
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let mapleader = ','
let g:netrw_liststyle=3
let ccstate=0
let hlstate=0
let prvsrc = ""
let rnustate=0
let synmatch=0
let g:airline#extensions#obsession#indicator_text = "🤖"
let g:airline#extensions#tabline#fnamemod = ':t' " :h filename-modifiers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffers_label = 'buffers'
let g:airline#extensions#tabline#tabs_label = 'tabs'
let g:sneak#s_next = 1
let g:sneak#label = 1
let g:sneak#target_labels =
            \ "asetgyniorqwdfjkuhl;zxcvbpm/ASETGYNIORQWDFJKUHL:ZXCVBPM?"
let g:sneak#use_ic_scs = 1
let g:sneak#absolute_dir = 1
let g:goyo_width=84 " (default: 80)
" let g:goyo_height " (default: 85%)
let g:goyo_linenr=1 " (default: 0)
" ----------------------------------------------------------------------}}}
" ----------------------------------------------------------------------
" SETTINGS{{{
" ----------------------------------------------------------------------
set autochdir
set sw=2
set iskeyword+=:
set iskeyword-=_
set nojoinspaces
set clipboard=unnamed
set cmdwinheight=41
set encoding=utf-8
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
set foldcolumn=3
set foldmethod=marker
set formatoptions+=tcroqnlM
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch "show match for partly typed search command
set keywordprg=":help"
set laststatus=2 "See status line, even for single window
set listchars=tab:»\ ,eol:¬
set nocuc
set nocul
set number
set relativenumber
set ruler
set scrolloff=5
set showcmd
set smartcase
set tabstop=4 shiftwidth=0 softtabstop=4 expandtab
set textwidth=0
set undofile
set ve=block
set directory=~/vim/swap/
set undodir=~/vim/vimundo/
" ----------------------------------------------------------------------}}}
" ----------------------------------------------------------------------
" MAPPINGS{{{
" ----------------------------------------------------------------------
" h: map-modes
     " COMMANDS                    MODES ~
" :map   :noremap  :unmap     Normal, Visual, Select, Operator-pending
" :nmap  :nnoremap :nunmap    Normal
" :vmap  :vnoremap :vunmap    Visual and Select
" :smap  :snoremap :sunmap    Select
" :xmap  :xnoremap :xunmap    Visual
" :omap  :onoremap :ounmap    Operator-pending
" :map!  :noremap! :unmap!    Insert and Command-line
" :imap  :inoremap :iunmap    Insert
" :lmap  :lnoremap :lunmap    Insert, Command-line, Lang-Arg
" :cmap  :cnoremap :cunmap    Command-line
" :tmap  :tnoremap :tunmap    Terminal-Job
" ----------------------------------------------------------------------
map <silent> <F1> :ToggleSpaceHi<CR>
map <silent> <F2> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
map <silent> <F3> :if (rnustate == 0) \| set nornu \| set number \| echo "relative line numbers OFF" \| else \| set rnu \| echo "relative line numbers ON" \| endif \| let rnustate=1-rnustate<cr>
map <silent> <F4> :let newsrc = @/ \|if (hlstate == 0\|\|newsrc != prvsrc) \| nohlsearch \| let hlstate = 1 \| echo "search highlights OFF" \| else \| set hlsearch \| let hlstate = 0 \| echo "search highlights ON" \| endif \| let prvsrc = newsrc<cr>
map <silent> <F5> :cd %:h<cr>:make<cr>:copen<cr>
map <silent> <F6> :exec "set cc+=" . getcurpos()[2] <cr>
" http://stackoverflow.com/a/6279316/3147897
map <silent> <F7> :if (synmatch == 0) \|syn match WhiteSpace / / containedin=ALL conceal cchar=·\|setl conceallevel=2 concealcursor=nvi\| echo "hidden characters ON" \| else \| setl conceallevel=0 \| echo "hidden characters OFF" \| endif \|let synmatch=1-synmatch\|set list!<cr>
map <silent> <f8> :echo "cursorcolumn toggled" \| set cuc! <CR>
map <silent> <f9> :echo "cursorline toggled" \| set cul! <CR>
map <silent> <F10> :if ccstate == 0 \| exec "set cc=73," . join(range(80,333), ',') \| let ccstate = 1 \| echo "cc = 73, 80+ (72 comment limit, 79 all else)" \| elseif ccstate == 1 \| exec "set cc=" . join(range(80,333), ',') \| let ccstate = 2 \| echo "cc = 80+ (79 limit)" \| else \|set cc= \| let ccstate = 0 \| echo "Color Columns OFF" \| endif<cr>
" map <silent> <F10> :if ccstate == 1 \| set cc=9,10,11,12,13,14,15,16,25,26,27,28,29,30,31,32,41,42,43,44,45,46,47,48,57,58,59,60,61,62,63,64,73,74,75,76,77,78,79,80 \| let ccstate = 2 \| echo "cc = SMALL Field Format" \| elseif ccstate == 2 \| set cc=9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,73,74,75,76,77,78,79,80 \| let ccstate = 3 \| echo "cc = LARGE Field Format" \| elseif ccstate == 0 \| exec "set cc=" . join(range(81,333), ',') \| let ccstate = 1 \| echo "cc = 81+" \| else \|set cc= \| let ccstate = 0 \| echo "Color Columns OFF" \| endif<cr>
map <silent><leader>ff :let @+ = expand("%:p")<cr>
" /Users/tallrice/.vimrc
map <silent><leader>fn :let @+ = expand("%:t")<cr>
" .vimrc
map <silent><leader>fp :let @+ = expand("%:p:h")<cr>
" /Users/tallrice
map <leader>ea :tab sball
map <leader>es :sp %%
map <leader>et :tabe %%
map <leader>ev :vsp %%
map <leader>ew :e %%
map <leader>qq :qa!<CR>
map <leader>ww :wqa<CR>
map <leader>wo :Wipeout<CR>
map <leader>tt :tabc<cr>
map h <Plug>Sneak_,
map j :
map l <Plug>Sneak_;
map <down> g<down>
" noremap / f
" noremap <silent> <PageDown> :call smooth_scroll#down(10, 30, 1)<CR>
" noremap <silent> <PageUp> :call smooth_scroll#up(10, 30, 1)<CR>
nnoremap <leader>s :vnew<CR>
nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>
nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap Y y$
noremap f /
noremap qj q:
" ----------------------------------------------------------------------
" NORMAL
" :nmap  :nnoremap :nunmap
map <S-C-Tab> <Plug>AirlineSelectPrevTab
map <C-Tab> <Plug>AirlineSelectNextTab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader><Space> za
nmap <leader>P :pu!<CR>
" nmap <leader>d :.! date<cr>
nmap <leader>d :bd<cr>
nmap <leader>f :let @* = expand("%:p")<CR>
" let g:filebeagle_suppress_keymaps = 1
" map <silent> <leader>_ <Plug>FileBeagleOpenCurrentWorkingDir
" map <silent> <leader>- <Plug>FileBeagleOpenCurrentBufferDir
nmap <leader>gv :tabedit $MYGVIMRC<CR>
nmap <leader>i :vert h index<CR>
nmap <leader>m :h map-overview<CR>
nmap <leader>n :let @* = expand("%")<CR>
nmap <leader>o :Obsession!<CR>
nmap <leader>p :pu<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>eb :tabedit ~/vim/ebooks.vim<CR>
nmap <silent> <leader>sp :set spell!<cr>
nmap T <Plug>Sneak_F
nmap t <Plug>Sneak_f
" xmap T <Plug>Sneak_F
" xmap t <Plug>Sneak_f
" omap T <Plug>Sneak_F
" omap t <Plug>Sneak_f
nnoremap <leader>, 10<c-w>>
nnoremap <leader>. 10<c-w><
nnoremap <leader>= 5<c-w>+
nnoremap <leader>- 5<c-w>-
" nnoremap <leader>p :call PervApp()<cr>
nnoremap <c-w><c-Bslash> :vertical resize<cr>
nnoremap & :&&<CR>
nnoremap ? F
nnoremap F ?
" nnoremap k <up>
nnoremap qF q?
nnoremap qf q/
nnoremap <silent> <C-Tab> :call TabBufNext()<CR>
nnoremap <silent> <S-C-Tab> :call TabBufPrev()<CR>
nnoremap <leader>gg :Goyo<cr>
nnoremap <leader>js :set tabstop=2 shiftwidth=0 softtabstop=2 expandtab<cr>
" ----------------------------------------------------------------------
" VISUAL and SELECT
" :vmap  :vnoremap :vunmap :vmapclear
" :xmap  :xnoremap  :xunmap  :xmapclear (visual only)
" :smap  :snoremap  :sunmap  :smapclear (select only)
vnoremap <bs> <left>
vnoremap <leader><Space> za
xnoremap & :&&<cr>
" ----------------------------------------------------------------------
" COMMAND-LINE
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
cnoremap %$ <C-R>=fnameescape(expand('%:p'))<cr>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
inoremap <c-r><c-r> <c-r>+
cnoremap <c-r><c-r> <c-r>+
" ----------------------------------------------------------------------}}}
" ----------------------------------------------------------------------
" AUTOCOMMANDS{{{
" ----------------------------------------------------------------------
autocmd! BufWritePost
autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif | AirlineRefresh
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" for text-type files, when moving by relative line count, use actual rows not display lines
autocmd! Filetype
autocmd FileType html,markdown,text nnoremap <expr> <down> v:count ? '<down>' : 'gj'
autocmd FileType html,markdown,text nnoremap <expr> <up> v:count ? '<up>' : 'gk'
" Customize alternate color for modified inactive tabs
" ----------------------------------------------------------------------}}}
" ----------------------------------------------------------------------
" CALLINGS{{{
" ----------------------------------------------------------------------
" call WordProcessor()
call camelcasemotion#CreateMotionMappings('')
" call camelcasemotion#CreateMotionMappings('<leader>')
" ----------------------------------------------------------------------}}}
" ----------------------------------------------------------------------
