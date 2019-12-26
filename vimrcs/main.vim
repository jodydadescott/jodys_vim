" try
" source ~/.vim_runtime/my_configs.vim
" catch
" endtry

set nofoldenable    " disable folding

set mouse=a
" set ttymouse=xterm2
" set ttyfast

" Fix cut and paste
" When pasting into term toggle to paste mode and back
if &term =~ "xterm.*"
let &t_ti = &t_ti . "\e[?2004h"
let &t_te = "\e[?2004l" . &t_te
function XTermPasteBegin(ret)
set pastetoggle=<Esc>[201~
set paste
return a:ret
endfunction
map <expr> <Esc>[200~ XTermPasteBegin("i")
imap <expr> <Esc>[200~ XTermPasteBegin("")
cmap <Esc>[200~ <nop>
cmap <Esc>[201~ <nop>
endif

" Powerline symbols are blurry, something to do with fonts
" let g:Powerline_symbols = 'fancy'

" colorscheme vim-colors-solarized
" colorscheme peaksea
set background=dark
set t_Co=256

" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ \ Col:\ %v

"autocmd VimEnter * silent !echo -ne "\033]1337;PushKeyLabels\a"

autocmd VimEnter * silent !echo -ne "\033]1337;SetKeyLabel=F1=Save & Quit\a"
autocmd VimEnter * map <F1> :x!<CR>
autocmd VimEnter * silent !echo -ne "\033]1337;SetKeyLabel=F2=Quit\a"
autocmd VimEnter * map <F2> :q!<CR>

"autocmd VimLeave * silent !echo -ne "\033]1337;PopKeyLabels\a"
"

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
