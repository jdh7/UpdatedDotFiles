"=============================================================
"       _  ___   ________  ___  _____          ____           " 
"      / |/ / | / /  _/  |/  / / ___/__  ___  / _(_)__ _      "
"     /    /| |/ // // /|_/ / / /__/ _ \/ _ \/ _/ / _ `/      "
"    /_/|_/ |___/___/_/  /_/  \___/\___/_//_/_//_/\_, /       "
"                                                /___/        "
"                                                             "
"=============================================================
" Source plugins
set runtimepath+=~/.config/nvim
set runtimepath+=~/.config/coc
set runtimepath+=~/.config/nvim/autoload/plugged/vim-snippets
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/mappings.vim
let g:python3_host_prog='/usr/bin/python3.9'


" -----------------General Settings----------------------
" PEP-8 standard when entering a python file
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
    " \ set softtabstop=4
    " \ set shiftwidth=4
    " \ set textwidth=79
    " \ set expandtab
    " \ set autoindent
    " \ set fileformat=unix
"Enable hybrid line numbers (absolute+relative)
" set number relativenumber 
set number
set norelativenumber 
"Enable buffer changed warning and command autocomplete
set autoread

"Indentation Options
filetype plugin indent on "Enabling Plugin and Indent
" set autoindent
set expandtab
set shiftwidth=4
" set smartindent
set smarttab
set tabstop=4
set softtabstop=4
set foldmethod=indent
set foldlevel=99
# recent change
filetype plugin on
filetype indent on
set autoindent

"Search Options
set hls is "Search highlights words as typed
set ignorecase
set incsearch
set smartcase
set ic
set rtp+=/home/otwx/.fzf
"let $FZF_DEFAULT_COMMAND = 'echo foo'

"Text Rendering Options
set display+=lastline
set encoding=UTF-8
set linebreak
set scrolloff=2
set sidescrolloff=5
syntax on 
set wrap


"UI Options
set laststatus=2 "always displays status bar
set ruler
set wildmenu
set tabpagemax=10
set cursorline "highlights the line where the cursor is
set noerrorbells
set title
set background=dark
set cmdheight=2
set colorcolumn=0
set mouse=n

"Miscellaneous Option
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set confirm
set spelllang=en_us
set backspace=indent,eol,start "Making sure backspace works
set history=1000
set hidden
set clipboard+=unnamedplus
set updatetime=300

let mapleader=","

"View maker
autocmd BufWinLeave *.* silent mkview
autocmd BufWinEnter *.* silent loadview 

set clipboard+=unnamedplus

set showtabline=2

" Get credit for my shitty code

let g:snips_author='john'
let g:snips_email='john.daniel.hill@gmail.com'
let g:snips_github='github.com/jdh7'
let g:ultisnips_python_style='numpy'

set nospell

" Bind F5 to save file if modified and execute python script in a buffer.
nnoremap <silent> <F5> :call SaveAndExecutePython()<CR>
vnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>

function! SaveAndExecutePython()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction
