"  .vimrc
"  Maintainer: C4rt
"  Version 0.3

" NEOBUNDLE CONFIG  
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif
if has('vim_starting')
  if &compatible
  	set nocompatible               " Be iMproved
  endif
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" My Bundles here:
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-notes'
NeoBundle 'xolox/vim-session'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'thinca/vim-themis'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'paranoida/vim-airlineish'
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'klen/python-mode'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'edkolev/tmuxline.vim'
call neobundle#end()
" Required:
filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" GENERAL 
" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit
" without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Vim-Notes Config
let g:notes_directories = ['~/Notes']
let g:notes_suffix = '.txt'
"let g:notes_smart_quotes = 0
let g:notes_list_bullets = ['•', '◦', '▸', '▹', '▪', '▫']
" Tagbar Config
let g:tagbar_usearrows = 1
nnoremap <F11> :TagbarToggle<CR>
" pydoc.vim Config
let g:pydoc_open_cmd = 'vsplit'

" synstatic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" DISPLAY
" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Enable syntax highlight
if has('syntax')
  syntax enable
endif

" Don't scan included files. The .tags file is more performant.
set complete-=i

" Highlight searches (use <C-L> to temporarily turn off highlighting; see
" the mapping of <C-L> below)
set hlsearch

" Use `Ctrl-L` to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled,
keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
"set smartindent
"set tabstop=4
"set shiftwidth=4
"set expandtab

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set,
" and this line is also included, vim will neither flash nor beep.  If
" visualbell is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
"set cmdheight=2
set laststatus=2
" Display line numbers on the left
set number

" Mapping
 let mapleader = "\<Space>"
 " Type <Space>o to open a new file:
 nnoremap <Leader>o :CtrlP<CR>
"  Type <Space>w to save file (a lot faster than :w<Enter>):
 nnoremap <Leader>w :w<CR>
"  Copy & paste to system clipboard with <Space>p and <Space>y:
 vmap <Leader>y "+y
 vmap <Leader>d "+d
 nmap <Leader>p "+p
 nmap <Leader>P "+P
 vmap <Leader>p "+p
 vmap <Leader>P "+P

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
set switchbuf=usetab
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>
nmap <leader>n :tabnew<Enter>

" Enter visual line mode with <Space><Space>:
 nmap <Leader><Leader> V

" Ctrl-A select all text
map <C-a> <esc>ggVG<CR>

" terryma/vim-expand-region with following mapping:
 vmap v <Plug>(expand_region_expand)
 vmap <C-v> <Plug>(expand_region_shrink)
" It allows to:
" Hit v to select one character
" Hit vagain to expand selection to word
" Hit v again to expand to paragraph
" Hit <C-v> go back to previous selection if I went too far

" Search mapping
" It allows to use the following search-and-replace flow:
" search things usual way using /something
" hit cs, replace first match, and hit <Esc>
" hit n.n.n.n.n. reviewing and replacing all matches
 vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
     \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
     omap s :normal vs<CR>

" to paste multiple lines multiple times with simple ppppp.
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" to wrap paragraph
nnoremap <leader>w gwip

" enter and delete in normal mode as in insert mode
function! Delete_key(...)
    let line=getline (".")
      if line=~'^\s*$'
            execute "normal dd"
            return
      endif
    let column = col(".")
    let line_len = strlen (line)
    let first_or_end=0
    if column == 1
       let first_or_end=1
    else
       if column == line_len
          let first_or_end=1
       endif
    endif
    execute "normal i\<DEL>\<Esc>"
    if first_or_end == 0
       execute "normal l"
    endif
endfunction
nnoremap <silent> <DEL> :call Delete_key()<CR>
nnoremap <silent> <CR> i<CR><Esc>

" Quickly select text you just pasted:
noremap gV `[v`]
" Stop that stupid window from popping up:
map q: :q

" Nerdtreetoggle
map <F2> :NERDTreeToggle<CR>

" Solarize Theme toogle
call togglebg#map("<F5>")

" vim-airline configuration
" NeoBundle 'bling/vim-airline'
set t_Co=256

let g:airline_theme = 'airlineish'
"let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enable = 1
let g:airline#extensions#syntastic#enable = 1
let g:airline_powerline_fonits = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'



" Spell Check
let b:myLang=0
let g:myLangList=["nospell","fr","en_gb"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
     setlocal nospell
  else
     execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap <silent> <F7> :call ToggleSpell()<CR>

"http://stackoverflow.com/questions/4998582/show-whitespace-characters-in-gvim
map <F4> :set list!<CR>
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
highlight SpecialKey term=standout ctermbg=yellow guibg=yellow
highlight RedundantSpaces term=standout ctermbg=Grey guibg=#ffddcc

set showmatch     " show matching brackets (),{},[]
set mat=5         " show matching brackets for 0.5 seconds

" commentary.vim
" Use gcc to comment out a line (takes a count) 
" gc to comment out the target of a motion

" For autocompletion, complete as much as you can.
set wildmode=longest,full

" Use Q to intelligently close a window
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer.
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif
  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction
nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" Set window title by default.
set title

" Set lenght of lines
set textwidth=120

" Always focus on splited window.
nnoremap <C-w>s <C-w>s<C-w>w
nnoremap <C-w>v <C-w>v<C-w>w

" Prevent replacing paste buffer on paste
"function! RestoreRegister()
"  let @" = s:restore_reg
"  return ''
"endfunction
"function! s:Repl()
"  let s:restore_reg = @"
"  return "p@=RestoreRegister()\<cr>"
"endfunction
"vmap <silent> <expr> p <sid>Repl()


