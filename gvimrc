" Automatically resize splits when resizing MacVim window
autocmd VimResized * wincmd =

" Font family and font size.
set guifont=Monaco\ for\ Powerline:h13.45
" set guifont=Monaco:h12.00

" smooth fonts.
set antialias

" Hide all scrollbars and toolbar
set guioptions-=L
set guioptions-=l
set guioptions-=r
set guioptions-=R
set guioptions-=T

" stop blinking
set gcr=n:blinkon0

" some transparency
set transparency=3

""
"" Hook for customizations
""
if filereadable(expand("~/.gvimrc.after"))
  source ~/.gvimrc.after
endif
