set nocompatible              " be iMproved, required
set hls ic is nu noswf
set timeoutlen=1000 ttimeoutlen=0
set modelines=0
set cursorline

filetype off                  " required
filetype plugin indent on    " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
"Plugin 'tpope/vim-fugitive'
"Plugin 'vim-syntastic/syntastic'
Plugin 'morhetz/gruvbox'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

call vundle#end()            " required

""""""""""""""""""""""""""""""
"mapping
"""""""""""""""""""""""""""""
nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprevious<CR>
nnoremap e $

autocmd BufWritePre * :%s/\s\+$//e

""""""""""""""""""""""""""""""
"set identation (python)
""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.py
    \ set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix

set encoding=utf-8
let python_highlight_all=1
syntax on

""""""""""""""""""""""""""""""
"gruvbox
""""""""""""""""""""""""""""""
set termguicolors
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

""""""""""""""""""""""""""""""
"Nerdtree
""""""""""""""""""""""""""""""
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

""""""""""""""""""""""""""""""
"airline
""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '|'
