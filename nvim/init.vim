set autoindent
syntax on
set number
filetype plugin indent on
function! TaiguzFoldText()
    return '+'. repeat('-', 4)
endfunction
function! JSFolds()
  let thisline = getline(v:lnum)
  if thisline =~? '\v^\s*$'
    return '-1'
  endif

  if thisline =~ '^import.*$'
    return 1
  else
    return indent(v:lnum) / &shiftwidth
  endif
endfunction
autocmd FileType javascript setlocal foldmethod=expr
autocmd FileType javascript setlocal foldexpr=JSFolds()
autocmd FileType html setlocal foldmethod=indent
autocmd FileType css setlocal foldmethod=indent
set foldtext=TaiguzFoldText()
set fillchars=fold:\ 
set foldcolumn=2
let g:loaded_matchparen=1
packadd vimball
source ~/.config/nvim/vim-plug/plugins.vim
source ~/.config/nvim/maps.vim
let g:airline_extensions = ['branch', 'tabline']
let g:airline_detect_paste=1
let g:airline_powerline_fonts = 1
let g:javascript_plugin_jsdoc = 1
if !exists('g:airline_symbols')
 let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:syntastic_tex_checkers = ['lacheck']
colorscheme wal
