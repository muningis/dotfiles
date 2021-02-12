" looks
syntax enable
set cmdheight=1
set number
set noeb vb t_vb=
set background=dark
set laststatus=2
set term=screen-256color
filetype plugin indent on

" encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" 4 spaces master race
set tabstop=4
set expandtab
set shiftwidth=4

" backspace
set backspace=2

" plugins
set runtimepath^=~/.vim/pack/plugins/ctrlp.vim
set runtimepath+=~/.vim/pack/plugins/YouCompleteMe

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_language_server =
\ [
\   {
\     'name': 'rust',
\     'cmdline': ['rust-analyzer'],
\     'filetypes': ['rust'],
\     'project_root_files': ['Cargo.toml']
\   }
\ ]
