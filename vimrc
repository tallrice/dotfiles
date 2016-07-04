" GENERAL SETTINGS"{{{

" "Pathogen""{{{
call pathogen#infect()
"}}}

" "On Windows, also use '.vim' instead of 'vimfiles'; """{{{
" this makes synchronization
" across (heterogeneous) systems easier.
" http://vim.wikia.com/wiki/Synchronize_configuration_to_many_computers
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif
"}}}

" "Persistent Undo ""{{{
set undofile
set undodir=~/.vim/vimundo/
"}}}

" " Keyword Program For K""{{{
set keywordprg=":help"
"}}}

" "ULTISNIPS""{{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}

" "CLIPBOARD""{{{
" See :h gui-clipboard: (in gui_w32.txt)
" When the "unnamed" string is included in the 'clipboard' option, the unnamed
" register is the same.  Thus you can yank to and paste from the clipboard
" without prepending "* to commands.
set clipboard=unnamed
"}}}

" "NETRW""{{{
" List Style
let g:netrw_liststyle=3
"}}}

" "VIRTUAL EDIT""{{{
" :h virtualedit
set ve=block
"}}}

"}}}

" "APPEARANCE""{{{

" "file formats""{{{
" set ffs=dos
"}}}

" "Character Encoding""{{{
set encoding=utf-8
"}}}

" "Syntax""{{{
syntax enable
"}}}

" "format""{{{
set formatoptions+=croql
" :h fo-table
"}}}

" "Background""{{{
if has('gui_running')
  set background=dark
else
  set background=light
endif
"}}}

" "Color""{{{
colo solarized
call togglebg#map("<F2>")
"}}}

" "Hidden Characters""{{{
" The following hexadecimal characters are used to display specific types of hidden characters:
" (To invoke these characters, type <C-v> then the Hexadecimal Numeric Character Reference)
" Hex. Ref.     Character Name                  Represents
" xAC           not sign (¬)                    line feed (unix line ending)
"·xB6           pilcrow (paragraph sign, ¶)     carriage return + line feed (windows line ending)
" xB7           middle dot (·)                  space
" xBB           angle quotation mark, right (») tab»

"if !exists("autocommands_loaded")
"  let autocommands_loaded = 1
"  au BufEnter * syn match WhiteSpace /\s/ containedin=ALL conceal cchar=·
"  au BufEnter * syn match \s / / containedin=ALL conceal cchar=·
"  au BufEnter * setl conceallevel=2 concealcursor=nvi
"endif

let synmatch=0
nnoremap <silent> <F7> :if (synmatch == 0) \|syn match WhiteSpace / / containedin=ALL conceal cchar=·\|setl conceallevel=2 concealcursor=nvi\| echo "hidden characters ON" \| else \| setl conceallevel=0 \| echo "hidden characters OFF" \| endif \|let synmatch=1-synmatch\|set list!<cr>
"}}}

" "Syntax Sync From Start"{{{
" :h syn-sync-first
nnoremap <F6> :syntax sync fromstart <cr>
"}}}

"Spell Checker""{{{
nnoremap <silent> <leader>sp :set spell!<cr>
"}}}

" "Information Display""{{{
set laststatus=2 " See status line, even for single window
set showcmd " Show partial commands on last line
set number " Line numbers
set ruler " Cursor Position
" set noacd / acd " autochdir: change to directory of file in buffer
set rnu " [nornu] "relativenumber" show the relative line number for each line
" map <silent> <F3> :set rnu<cr>
let rnustate=0
nnoremap <silent> <F3> :if (rnustate == 0) \| set nornu \| set number \| echo "relative line numbers OFF" \| else \| set rnu \| echo "relative line numbers ON" \| endif \| let rnustate=1-rnustate<cr>
"}}}

" "SEARCH""{{{
set hls " "highlight search"
set is " [nois] "incsearch" show match for partly typed search command
" "How to toggle Vim's search highlight visibility without disabling it"
" http://stackoverflow.com/questions/9054780/how-to-toggle-vims-search-highlight-visibility-without-disabling-it
let hlstate=0
let prvsrc = ""
nnoremap <silent> <F4> :let newsrc = @/ \|if (hlstate == 0\|\|newsrc != prvsrc) \| nohlsearch \| let hlstate = 1 \| echo "search highlights OFF" \| else \| set hlsearch \| let hlstate = 0 \| echo "search highlights ON" \| endif \| let prvsrc = newsrc<cr>
set ic " "ignorecase"
set scs " "Smartcase"
"}}}

" "TAB""{{{
" tabstop (width of tab character)
" expandtab (causes spaces to be used in place of tab characters)
" soft tabstop (fine tunes the amount of whitespace to be inserted)
" shiftwidth (determines the amount of ws to be inserted or removed
"             using the indentation commands in normal modes)
set ts=4 sw=4     sts=4 expandtab
"}}}

" "HIGHLIGHTS""{{{
" cursorcolumn: highlight the screen column of the cursor
" (local to window)
set nocuc "cuc
map <silent> <f8> :echo "cursorcolumn toggled" \| set cuc! <CR>
" cursorline: highlight the screen line of the cursor
set nocul "cul
" colorcolumn: columns to highlight
" (local to window)
" set cc=8,16,24,32,40,48,56,64,72
set cc=
let ccstate=0
map <silent> <F9> :if ccstate == 0 \| set cc=9,10,11,12,13,14,15,16,25,26,27,28,29,30,31,32,41,42,43,44,45,46,47,48,57,58,59,60,61,62,63,64,73,74,75,76,77,78,79,80 \| let ccstate = 1 \| echo "cc = SMALL Field Format" \| elseif ccstate == 1 \| set cc=9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,73,74,75,76,77,78,79,80 \| let ccstate = 2 \| echo "cc = LARGE Field Format" \| else \|set cc= \| let ccstate = 0 \| echo "Color Columns OFF" \| endif<cr>
" map <silent> <F9> :if ccstate == 0 \| set cc=9,10,11,12,13,14,15,16,25,26,27,28,29,30,31,32,41,42,43,44,45,46,47,48,57,58,59,60,61,62,63,64,73,74,75,76,77,78,79,80 \| let ccstate = 1 \| echo "Color Columns ON" \| else \| set cc= \| let ccstate = 0 \| echo "Color Columns OFF" \| endif<cr>
map <silent> <F5> :ToggleSpaceHi<CR>
"}}}

" "Size of Display""{{{
" columns: width of the display
" set co=80
" set co=180
" lines: number of lines in the display
" set lines=25
" set lines=60
" Restore screen size and position
" " http://vim.wikia.com/wiki/Restore_screen_size_and_position
" " To enable the saving and restoring of screen positions.
if has("gui_running")
  if has("gui_gtk2")
  elseif has("gui_macvim")
  elseif has("gui_win32")
    " Maximize screen size at startup
    " sim[alt] {key}: simulate pressing {key} while holding Alt pressed.
    " ~ is used by simalt to represent the <Space> character. >
    " remove <silent> after au for Windows v7.3
    au GUIEnter * simalt ~x
  endif
endif
"}}}

" "Scrolling""{{{

" Smooth Scrolling
" :h tips
" :h omap-info for operator pending mapping technique
" map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
" map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" Context Lines Around Cursor
set so=5 "scrolloff
map <F10> :let &scrolloff=999-&scrolloff<CR>
"}}}
"}}}

" "MAPPINGS""{{{

" "Help""{{{
nmap <leader>m :h map-overview<CR>
" :h usr_05.txt "settings"
" :h usr_40.txt "commands"
" :h netrw-bookmarks
" :h map.txt "Key mapping, abbreviations and user-defined commands"
" :h key-notation key-codes keycodes
"
" :h map-modes "1.3 MAPPING AND MODES"
"                                                 *map-overview* *map-modes*
" Overview of which map command works in which mode:
"
"     commands:                                 modes:
"                                        Normal  Visual+Select  Operator-pending ~
" :map   :noremap   :unmap   :mapclear     yes        yes            yes
" :nmap  :nnoremap  :nunmap  :nmapclear    yes         -              -
" :vmap  :vnoremap  :vunmap  :vmapclear     -         yes             -
" :omap  :onoremap  :ounmap  :omapclear     -          -             yes
"                                           Visual    Select ~
" :vmap  :vnoremap  :vunmap  :vmapclear       yes      yes
" :xmap  :xnoremap  :xunmap  :xmapclear       yes       -
" :smap  :snoremap  :sunmap  :smapclear       -        yes
"                                           Insert  Command-line  Lang-Arg ~
" :map!  :noremap!  :unmap!  :mapclear!       yes        yes         -
" :imap  :inoremap  :iunmap  :imapclear       yes         -          -
" :cmap  :cnoremap  :cunmap  :cmapclear        -         yes         -
" :lmap  :lnoremap  :lunmap  :lmapclear       yes*       yes*       yes*
"
" :h map-listing for key to :map command "1.4 LISTING MAPPINGS"
" :h map-which-keys (,m) "1.7 WHAT KEYS TO MAP"
"}}}

" "Leader""{{{
let mapleader = ','
"}}}

" "Command-Line""{{{
map j :
noremap qj q:
"}}}

" "Abbreviations""{{{
" :h usr_24.txt "24.7 Abbreviations"
" :h iabbrev
iabbrev #d "-------------------------------------------------------------------"
" iabbrev #cd " "-------------------------------------------------------------------"
iabbrev #s "*******************************************************************"
" iabbrev #cs " "*******************************************************************"
"}}}

" "Background""{{{
noremap <leader>t :set bg=light<cr>
noremap <leader>k :set bg=dark<cr>
nmap <leader>d :.! date<cr>
"}}}

" "Movement""{{{
noremap <CR> j
vnoremap <bs> <left>
"}}}

" "Yank"""{{{
nnoremap Y y$
"}}}

" "[S]earch""{{{
nnoremap s f|nnoremap S F
nnoremap t ;|nnoremap T ,
nnoremap ; s
"}}}

" "[F]ind""{{{
nnoremap f /
nnoremap F ?
nnoremap qf q/
nnoremap qF q?
"}}}

" "QUIT / SAVE""{{{
" Quit all windows without saving with <leader>qq
nmap <silent> <leader>qq :qa!<CR>
" Quit all windows and save <leader>ww
nmap <silent> <leader>ww :wqa<CR>
"}}}

" "Tab/Window Navigation""{{{
noremap <C-Tab> gt
noremap <S-C-Tab> gT
noremap <Tab> <C-w><C-w>
noremap <S-Tab> <C-w>W
"}}}

" "Vertical Resizing""{{{
noremap = <c-w>+
noremap - <c-w>-
noremap + <c-w>_
noremap _ z1<cr>
"}}}

" "Horizontal Resizing""{{{
noremap / <c-w><
noremap \ <c-w>>
noremap ? :vertical resize 1<cr>
noremap \| :vertical resize 999<cr>
" noremap \| <c-w>|
"}}}

" "CTAGS NAVIGATION""{{{
noremap <C-[> <C-t>
" See Also: commentary.vim plugin, g[, g], etc.
" https://github.com/tpope/vim-commentary
"}}}

"}}}

" "PRACTICAL VIM""{{{

" T34: Recall Commands From History"{{{
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
set history=10000
"}}}

" T36: Track open files with the buffer list"{{{
" Obsolete See Unimpaired Plugin For These Mappings:
" https://github.com/tpope/vim-unimpaired
" nnoremap <silent> [b :bprevious <CR>
" nnoremap <silent> ]b :bnext <CR>
" nnoremap <silent> [B :bfirst <CR>
" nnoremap <silent> ]B :blast <CR>
"}}}

" T38: Manage Hidden Files"{{{
set hidden
"}}}

" T41: Open a File by Its Filepath Using ':edit'"{{{
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
"}}}

" T54: Jump Between Matching Parenthesis"{{{
runtime macros/matchit.vim
"}}}

" T92: Repeat the Previous Substitute Command"{{{
" :h &
"   --> synonym for :s, which repeats the last sub.
"   --> if any flags were used, the & command disregards them
"       making the & command trigger the :&& command is more useful
"       Mappings to fix & Normal command and create Visual equivalent
nnoremap & :&&<CR>
xnoremap & :&&<CR>
"}}}

" T96: Find and Replace Across Multiple Files"{{{
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
"}}}
"}}}

" "VIMCAST""{{{

" V1: Show invisibles"{{{
" turn on invisibles
" nmap <silent> <leader>k :syn clear WhiteSpace \|set nolist<CR>
nmap <silent> <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:¸\ ,eol:¬
" Use the same symbols as UltraEdit for tabstops and EOLs
set listchars=tab:»\ ,eol:¬
set nolist
"}}}

" V2: Tabs and Spaces

" V3: Whitespace preferences and filetypes

" V4: Tidying whitespace

" V5: Indentation commands

" V6: Working with buffers"{{{
" command:
" ls to view buffers
" bn, bp,
" a for active, # for alternate buffer
" [C-^] to switch between active and alternate buffers
" like alt-tab in windows, or command-tab in OSx
" + sign for modified buffer
"}}}

" V7: Working with windows

" V8: Working with tabs

" V9: How to use tabs

" V10: Creating the Vs loga as ASCII art

" V11: Using the changelist and jumplist

" V12: Modal editing: undo, redo, and repeat

" V13: Cleaning up with Vim

" V14: The :edit command"{{{
" Shortcuts for opening files in the same directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
"}}}

" V15: The file explorer

" V16: Soft wrapping text

" V17: Hard wrapping text

" V18: Formatting text with par

" V19: Spell checking

" V20: Running Vim within IRB

" V21: Converting markdown to structured HTML with a macro

" V22: Selecting columns with visual block mode

" V23: Converting HAML to ERB with Vim macros

" V24: Updating your vimrc file on the fly

" Automatically source the .vimrc upon write command"{{{
if has("autocmd")
  autocmd! BufWritePost     " Remove ALL autocommands for the current group.
  if has("gui_macvim")
    autocmd BufWritePost .vimrc source $MYVIMRC
  elseif has("gui_win32")
    autocmd BufWritePost _vimrc source $MYVIMRC
  endif
endif

nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>gv :tabedit $MYGVIMRC<CR>
nmap <leader>i :vert h index<CR>
nmap <leader>y :tabedit /Users/tallrice/Public/site-packages/newpy.py<CR>
nmap <leader>pv :tabedit ~/.vim/practicalvim.vim<CR>
nmap <leader>so :tabedit ~/.vim/bundle/vim-colors-solarized-master/colors/solarized.vim<CR>
"}}}

" V25: Creating colorschemes for Vim"{{{

" Show syntax highlighting groups for word under cursor
" Note- this script has been replaced by hilinks.vim (see plugin directory),
" which is invoked with <leader>hlt
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"}}}

" V26: Bubbling text

" V27: Synchronizing plugins with git submodules and pathogen

" V28: Refining search patterns with the command-line window

" V29: Aligning text with Tabular.vim

" V30: Undo branching and Gundo.vim

" V31: Fugitive.vim - a complement to command line git

" V32: Fugitive.vim - working with the git index

" V33: Fugitive.vim - resolving merge conflicts with vimdiff

" V34: Fugitive.vim - browing the git object database

" V35: Fugitive.vim - exploring the history of a git repository

" V36: VimGolf - Prime Numbers

" V37: How to Fold"{{{
" help fold-methods
" command:  zi for turning on and off folding
"           zj, zk to go up and down
"           za, toggle current fold open/closed
" Space to toggle folds
nnoremap <leader><Space> za
vnoremap <leader><Space> za
"           zc to close current (nested) fold
"           zM close all folds
"           folds to current position, to reveal cursor
"           clean-up expanded folds when searching for multiple occurences
"}}}

" V38: Writing a custom fold expression"{{{
" define custom fold expression
" vim-markdown-folding plugin
set foldcolumn=3
set foldmethod=marker
"}}}

" V39: Profiling Vimscript performance

" V40: Long-range line duplication

" V41: Meet the arglist

" V42: Populating the arglist

" V43: Using :argdo to change multiple files

" V44: Search multiple files with :vimgrep

" V45: Project-wide find and replace"{{{
" commands :%s/find/replace/g
"}}}

" V46: Search for the selected text"{{{
" In normal mode, * command searches for word under cursor
" In visual mode, same thing happens, expanding range of current selection.
" To select text in visual mode, then search for the selection, one bad option is:
" :vmap X y/<C-R>"<CR>
" This mapping does not work for text selections with special characters, because
" the regular expression created by the text can have unintended consequences
" A better solution is to install the visual-star-search plugin
" Refer to Practical Vim Tip 78 for details about the literal switch that is used.
"}}}

" V47: Smart search with :Subvert

" V48: Supercharged substitution with :Subvert

" V49: Enhanced abbreviations with :Abolish

" V50: An introduction to vspec

" V51: Simple operations using the default register

" V52: Meet the yank register

" V53: Using Vim's named registers

" V54: Pasting from Visual mode

" V55: Pasting from Insert mode

" V56: Simple calculations with Vim's expression register

" V57: Evaluating scripts with Vim's expression register

" V58: Accessing the system clipboard from Vim

" V59: Using Vim's paste mode with the system paste command

" V60: Comparing buffers with vimdiff

" V61: Creating repeatable mappings with repeat.vim

" V62: Creating mappings that accept a count

" V63:

" V64:

" V65:

" V66:

" V67:

" V68:

" V69:

" V70:
"}}}

" "STACKOVERFLOW""{{{

" "Remapping netrw mappings""{{{
" http://unix.stackexchange.com/questions/31575/remapping-keys-in-vims-directory-view
augroup netrw_dvorak_fix
    autocmd!
    autocmd filetype netrw call Fix_netrw_maps_for_dvorak()
augroup END
function! Fix_netrw_maps_for_dvorak()
" " Up/Down
"     noremap <buffer> <C-w>n <C-w>j
"     noremap <buffer> <C-w>N <C-w>J
"     noremap <buffer> n j
"     noremap <buffer> <S-n> 5j
"     noremap <buffer> <C-n> 10j
"     noremap <buffer> <C-w>t <C-w>k
"     noremap <buffer> <C-w>T <C-w>K
"     noremap <buffer> t k
"     noremap <buffer> <S-t> 5k
"     noremap <buffer> <C-t> 10k
endfunction
"}}}

" "Paste as a New Line""{{{
" help p
" http://stackoverflow.com/questions/1346737/how-to-paste-in-a-new-line-with-vim
nmap <leader>p :pu<CR>
nmap <leader>P :pu!<CR>
"}}}

" "Copy Filename and Full Path""{{{
" Filename:
nmap <leader>n :let @* = expand("%")<CR>
" Full Path:
nmap <leader>f :let @* = expand("%:p")<CR>
" See help for expand and clipboard
"}}}

" "Auto-comment feature is not working""{{{
" http://ubuntuforums.org/showthread.php?t=1212765
if has("autocmd")
  filetype plugin indent on
endif
" Also, one of the following is needed
" 1. filetype on <or>...
set filetype=vim
"}}}

"}}}

" vi:rnu:
