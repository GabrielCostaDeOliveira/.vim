call plug#begin('~/.vim/plugged')
	"tema
	Plug 'joshdick/onedark.vim'		
	"air-line
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	"completar parenteses
	Plug 'jiangmiao/auto-pairs'
	"
	Plug 'tpope/vim-surround'
	"verificação de sintaxe
	Plug 'dense-analysis/ale'
call plug#end()

""""""""""""""""""""""""
"configurações iniciais"
""""""""""""""""""""""""
syntax on 
colorscheme onedark

set number 
set mouse=a
set title
set cursorline
set encoding=utf-8 " Importante para o YCM
set termguicolors
set autoindent
set incsearch
set wildmenu
set confirm
set magic
set ttimeoutlen=50


""""""""""""""""""""""""
"       cursor         "
""""""""""""""""""""""""

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif


""""""""""""""""""""""""
"     vim-airline     "
""""""""""""""""""""""""


let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

" old vim-powerline symbols
let g:airline_symbols = {}
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = ' ⭠ '
let g:airline_symbols.readonly = ' ⭤ '
let g:airline_symbols.linenr = ' ⭡ '

""""""""""""""""""""""""
"         ale          "
""""""""""""""""""""""""

let g:ale_linters = {'c': ['gcc']}
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
"highlight ALEErrorSign ctermbg=NONE ctermfg=red
"highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

""""""""""""""""""""""""
"       atalhos        "
""""""""""""""""""""""""
let mapleader="\<space>"

map q :quit<CR>
map <C-q> :quit!<CR>
map <leader>j :bel term<CR>
