execute pathogen#infect()
syntax on
filetype plugin indent on

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a 
set backspace=2
set backspace=indent,eol,start

"Rebind <Leader> key
let mapleader = ","

" Quicksave command
noremap <C-A> :update<CR>
vnoremap <C-A> <C-C>:update<CR>
inoremap <C-A> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

" Open NERDTree
noremap <Leader>x :NERDTreeToggle<CR>

" CTRLP
" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number
set tw=99
set nowrap
set fo-=t
set colorcolumn=100
highlight ColorColumn ctermbg=23

" Easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"=========================================
"        PYTHON IDE CONFIGURATION        
"=========================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
lnoremap <C-P> :CtrlP<CR>
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enamble_shortcuts = 1
let g:pymode_rope_gogo_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_python = 'python3'
map <Leader>b Oimport ipdb; ipdb.set_trace()

" Enable Smart tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"Better navigating through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
   if pumvisible()
	if a:action == 'j'
	    return "\<C-N>"
	elseif a:action == 'k'
	    return "\<C-P>"
	endif
   endif
   return a:action
endfunction

" Python folding
" " mkdir -p ~/.vim/ftplugin
" " wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

autocmd FileType ruby nmap <buffer> <C-n> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <C-n> <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <C-n> <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <C-r> <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <C-r> <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <C-r> <Plug>(xmpfilter-run)

nnoremap <CR> :noh<CR><CR>
