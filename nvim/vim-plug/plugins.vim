" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    "Better Auto Completion"
    Plug 'Shougo/deoplete.nvim'
    "Bottom Line"
    Plug 'bling/vim-airline'
    "Air Line Themes"
    Plug 'vim-airline/vim-airline-themes'
    "Git Fugitive"
    Plug 'tpope/vim-fugitive'
    "Syntax Checker"
    Plug 'vim-syntastic/syntastic'
    "Auto Completion"
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Colorscheme"
    Plug 'dylanaraps/wal.vim'
    "Comments"
    Plug 'tpope/vim-commentary'
    call plug#end()
