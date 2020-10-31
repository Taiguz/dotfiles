map <C-s> :w<ENTER>
map \p i(<Esc>ea)<Esc>
map \c i{<Esc>ea}<Esc>
map <C-q> :q<ENTER>
map <C-b> :NERDTreeToggle<ENTER>
map <C-t> :!termite &<ENTER>
map <A-1> :tabn1<ENTER>
map <A-2> :tabn2<ENTER>
map <A-3> :tabn3<ENTER>
map <A-4> :tabn4<ENTER>
map <A-5> :tabn5<ENTER>
map <A-6> :tabn6<ENTER>
nmap <C-j> gj
nmap <C-k> gk
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
map <C-l> :!~/compila-latex.sh $(echo %)<ENTER>
map <F2> :!termite -- aspell check $(echo %) <ENTER>
