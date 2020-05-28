set nocompatible
filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim
set rtp+=$HOME/.vim/bundle/ctrlp.vim

call vundle#begin()

" General plugins
Plugin 'VundleVim/Vundle.vim'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhartington/oceanic-next'
" Haskell plugins start
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc'
" Haskell plugins end

Plugin 'neoclide/coc.nvim', {'branch':'release'}
" typescript
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'mhartington/nvim-typescript', {'do': './install.sh'}
" For Denite features
Plugin 'Shougo/denite.nvim'

call vundle#end()

set termguicolors

colorscheme OceanicNext

" Set deoplete commands
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
"

" Haskell related config start
"
"let g:deoplete#enable_at_startup = 1
let g:airline#extensions#ale#enabled = 1

nnoremap <Leader>ht :GhcModType<cr>
nnoremap <Leader>htc :GhcModTypeClear<cr>
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>

"haskell related config ends

filetype plugin indent on

set number relativenumber
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" nerdtree config start
"
" Toggle nerdtree key
"
map <A-n> :NERDTreeToggle<CR>

" OPEN NERDTree if opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" nerdtree config end
