call plug#begin('~/.config/nvim/autoload/plugged')

"   Tools
    Plug 'honza/vim-snippets'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-commentary'
    Plug '~/.fzf'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

"   Color Schemes
    Plug 'flazz/vim-colorschemes'

call plug#end()



""" Colorscheme and aesthetics """
" Enable transparency 
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

highlight Normal ctermbg=none
highlight NonText ctermbg=none

" Select colorscheme vim-colorschemes
colorscheme OceanicNext

if (has("termguicolors"))
 set termguicolors
endif

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" Bring in all settings
source $HOME/.config/nvim/treesitter.vim
source $HOME/.config/nvim/lualine.vim
source $HOME/.config/nvim/coc-plug-settings.vim
















