
" -----------------Key Bindings/Mappings-----------------
" leader
let mapleader=","

"Reload source file 
map <C-s> ;source %<CR>

"Window resizing remaps
nnoremap <UP> :resize +1<CR>
nnoremap <DOWN> :resize -1<CR>
nnoremap <LEFT> :vertical resize +1<CR>
nnoremap <RIGHT> :vertical resize -1<CR>

"Remap ESC in all modes
inoremap mk <ESC>
vnoremap mk <ESC>

"Remap j/k to not skip wrapped lines
nnoremap k gk
nnoremap j gj

"Remap ESC in terminal mode
if has('nvim')
  tnoremap mk <C-\><C-n>
  " tnoremap <M-[> <Esc>
  " tnoremap <C-v><Esc> <Esc>
endif

"Split window and movement
    " F2 = Horizontal split
    " F3 = Vertical split
    " F4 = Close split window
    " F5 = Resize windows

" Make type hinting easy
inoremap -. ->


nnoremap <F2> <C-w>s
nnoremap <F3> <C-w>v
nnoremap <F4> <C-w>q
" nnoremap <F5> :CocCommand python.execInTerminal<CR>

"Window and tab navigation
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

"De-highlight search
nmap <silent> <leader>/ ;noh<CR>

"Next buffer, close buffer
nnoremap <C-t> :bn<CR>
nnoremap <C-w> :bd<CR>

"remap :
nnoremap ; :
vnoremap ; :

" -----------------Theme and Status Line Settings--------

