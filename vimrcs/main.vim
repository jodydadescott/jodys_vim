" try
" source ~/.vim_runtime/my_configs.vim
" catch
" endtry

set nofoldenable    " disable folding

set mouse=a
" set ttymouse=xterm2
" set ttyfast

" Fix cut and paste
" Use bracketed paste mode if terminal supports it
if has("patch-8.0.0238")
  " Use built-in bracketed paste support in Vim 8.0.0238+
  if &term =~ "screen\\|tmux\\|xterm\\|rxvt"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    let &t_PS = "\e[200~"
    let &t_PE = "\e[201~"
  endif
else
  " Fallback for older Vim versions
  if &term =~ "xterm.*\\|screen.*\\|tmux.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
      set pastetoggle=<Esc>[201~
      set paste
      return a:ret
    endfunction
    execute "set <f28>=\e[200~"
    execute "set <f29>=\e[201~"
    map <expr> <f28> XTermPasteBegin("i")
    imap <expr> <f28> XTermPasteBegin("")
    vmap <expr> <f28> XTermPasteBegin("")
    cmap <f28> <nop>
    cmap <f29> <nop>
  endif
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
