" looks
syntax enable
set cmdheight=1
set number
set noeb vb t_vb=
set background=dark
set laststatus=0
set term=xterm-256color
filetype plugin indent on

" theme
let g:tokyonight_disable_italic_comment = 1
let g:tokyonight_style = 'night'
let g:tokyonight_transparent_background = 1
let g:lightline = {'colorscheme' : 'tokyonight'}
colorscheme tokyonight

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

" NERDTree
"" Show hidden files and dirs
let NERDTreeShowHidden=1
"" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
"" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" keybinds
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Open terminal
fu T()
    terminal
    res 20
    wincmd x
endfu
