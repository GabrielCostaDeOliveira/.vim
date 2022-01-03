call plug#begin('~/.vim/plugged')
	"tema
	Plug 'joshdick/onedark.vim'		
	"air-line
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	"
	Plug 'tpope/vim-surround'
	"verificação de sintaxe
	Plug 'dense-analysis/ale'
	"coc
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"sintaxe 
	Plug 'sheerun/vim-polyglot'
	"nerdtree 
	Plug 'preservim/nerdtree'
	"nerdtree
	Plug 'preservim/nerdtree' 
	"git 
	Plug 'airblade/vim-gitgutter'
	"rainbow 
	Plug 'luochen1990/rainbow'
	"JSX syntax highlighting and indenting
	Plug 'maxmellon/vim-jsx-pretty'
	"close tag
	Plug 'mattn/emmet-vim'
call plug#end()

""""""""""""""""""""""""
"configurações iniciais"
""""""""""""""""""""""""


syntax on 
colorscheme onedark

set list            "mostar caracteres invisíveis 
set autoindent      "novas linhas herdão a indentação da linha anterior
set shiftround
set ignorecase      "Maiúsculo = minusculo na pesquisa
set incsearch       "mastra a busca parcial 
set number 
set mouse=a
set title
set cursorline
set encoding=utf-8 " Importante para o YCM
set termguicolors
set autoindent
set wildmenu
set confirm
set magic
set ttimeoutlen=0

"configurações iniciais coc

set hidden " if hidden is not set, TextEdit might fail.
set nobackup " Some servers have issues with backup files, see #649
set nowritebackup
set cmdheight=2 " Better display for messages
set updatetime=300 " You will have bad experience for diagnostic messages when it's default 4000.
set redrawtime=10000
set shortmess+=c   " don't give ins-completion-menu messages.
set signcolumn=yes " always show signcolumns


""""""""""""""""""""""""
"        rainbow       "
""""""""""""""""""""""""

let g:rainbow_active = 1

let g:rainbow_conf = {
\	'guifgs': [ '#e5c07b', '#e06c75','Aquamarine', '#c678dd', 'firebrick','lightyellow', 'DeepPink', 'BlueViolet'],
\	'ctermfgs': ['lightyellow', 'lightblue', 'lightcyan', 'lightmagenta'],
\}


""""""""""""""""""""""""
"        coc-vim       "
""""""""""""""""""""""""

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


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


""""""""""""""""""""""""
"         ale          "
""""""""""""""""""""""""
let g:ale_linters = { 'cpp': ['clang', 'g++'], 
                     \'c': ['clang'] }

"let g:ale_sign_error = '❌'
"let g:ale_sign_warning = '⚠️'
"let g:ale_linters = {'c': ['gcc']}
"let b:ale_fixers = ['prettier', 'eslint']
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"highlight ALEErrorSign ctermbg=NONE ctermfg=red
"highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

""""""""""""""""""""""""
"       termbug        "
""""""""""""""""""""""""
packadd termdebug 
let g:termbug_popup  = 0
let g:termdebug_wide = 163

""""""""""""""""""""""""
"         jsx          "
""""""""""""""""""""""""

let g:vim_jsx_pretty_highlight_close_tag = 1

""""""""""""""""""""""""
"       atalhos        "
""""""""""""""""""""""""
let mapleader="\<space>"

map q :quit<CR>
map <leader>; A;<esc>
map <C-q> :quit!<CR>
map <leader>j :bo term<CR>

"Movimentação de tela rápida

nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l


"Quicky space to normal mode
imap jj <esc>


"NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"seleção híbrida para mostrar o numero de linha 
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber 

