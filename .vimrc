set nocompatible
filetype off

" ============= General Config =================

let mapleader="\\"
let maplocalleader="\\\\"

set number
set backspace=indent,eol,start
set history=1000
set showcmd
set noshowmode
set gcr=a:blinkon0
set visualbell
set autoread
set hidden
set ignorecase
set smartcase
set incsearch
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

  
syntax on


" ============= Vundle Intialization =================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" ============= Plugin Management =================

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Raimondi/delimitMate'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'reedes/vim-wordy'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-lexical'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'sjbach/lusty'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ============ Theme- Solarized ================

syntax enable
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 256
colorscheme solarized

" ============ Turn off Swap Files =================

set noswapfile
set nobackup
set nowb

" ============ Persistent Undo  =================

if has('persistant_undo')
	silent !mkdir ~/.vim/backups > dev/null 2>&1
	set undodir=~/.vim/backups
	set undofile
endif

" ============ Indentation  =================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

"set list listchars=tab:\ \ ,trail:.

set nowrap
set linebreak


  

" ============ Folds ================

set foldmethod=indent
set foldnestmax=3
set nofoldenable


" ============ Completion ================


" ============ Scrolling ================

set scrolloff=8
set sidescrolloff=15
set sidescroll=1


" ============ General Mapping ================

noremap - dd\|p
noremap _ dd\|P

inoremap <c-d> <Esc>ddi
inoremap jj <Esc>
inoremap jk <Esc>
inoremap <c-u> <Esc>viwUi

nnoremap <c-u> <Esc>viwUn
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>vev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <space> :

" ============ AutoCommands ================

autocmd FileType markdown,mkd,md,mdown,mkdn,mdwn,mdtxt,mdtext,text call SetMarkDownOptions()
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


function! SetMarkDownOptions()
  Goyo
  PencilSoft
endfunction

" ============ NerdTree ================

let g:NERDTreeDirArrows=0

map <C-n> :NERDTreeToggle<CR>

" ============ EasyMotion ================

let g:EasyMotion_do_mapping=0
let g:EasyMotion_starline=0

nmap <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap n <Plug>(easymotion-next)

nmap N <Plug>(easymotion-prev)
nmap <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>h <Plug>(easymotion-linebackward)


" ============ Goyo ================

nnoremap <Leader>G :Goyo<CR>


" ============ Wordy ================

let g:wordy#ring = [
  \ 'weak',
  \ ['being', 'passive-voice', ],
  \ 'business-jargon',
  \ 'weasel',
  \ 'puffery',
  \ ['problematic', 'redundant', ],
  \ ['colloquial', 'idiomatic', 'similies', ],
  \ 'art-jargon',
  \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
  \ ]

nnoremap <silent> , :NextWordy<CR>


" ============ Indent Guide ================

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=darkgrey   ctermbg=236
hi IndentGuidesEven guibg=darkgrey   ctermbg=237
let indent_guides_color_change_percent = 10
let indent_guides_guide_size = 1


" ============ Syntastic ================

let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall'

" ============ Airline ================

set laststatus=2

"let g:airline_left_sep="|"
"let g:airline_right_sep='|'
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_iminsert=0
let g:airline_inactive_collapse=1
let g:airline_theme='badwolf'
let g:airline_powerline_font=1
let g:airline#extensions#tabline#enabled = 1

" ============ You Complete Me ================

let g:ycm_register_as_syntastic_checker = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'



" ============ Formatting ================

"Make the 81st column stand out 
highlight ColorColumn ctermbg=darkred
call matchadd('ColorColumn', '\%81v', 100)

"Highlight matches when jumping to next 
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
  highlight WhiteOnRed ctermfg=white ctermbg=red
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#\%('.@/.'\)'
  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
"    set list
