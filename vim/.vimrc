"Basic Setup: https://wiki.python.org/moin/Vim
syntax on

filetype plugin on
"filetype indent plugin on


" to be able to copy from selection
"https://superuser.com/questions/436890/cant-copy-to-clipboard-from-vim
set mouse=v

set background=dark

set hlsearch


" downloads plug.vim if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " Trigger PlugInstall when Vim starts
    autocmd VimEnter * PlugInstall
endif


call plug#begin('~/.vim/plugged')

" Example plugins
Plug 'dense-analysis/ale'

call plug#end()


" Enable specific linters for Python (e.g., flake8, pylint, mypy)
let g:ale_linters = {
\   'python': ['flake8', 'pylint', 'mypy'],
\}

" Enable automatic fixing on save
let g:ale_fix_on_save = 1

" Configure the fixers to use for Python (e.g., black, autopep8)
let g:ale_fixers = {
\   'python': ['black', 'autopep8'],
\}

let g:ale_python_black_options = '--line-length 79'
