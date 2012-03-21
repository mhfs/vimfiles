""
"" Load Pathogen
""
call pathogen#infect()

""
"" Basic Setup
""
colorscheme solarized
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
set scrolloff=2       " Show 2 lines of context around the cursor.
set sidescrolloff=3   " Show 3 columns of context around the cursor.
set visualbell        " No beeping.
set noerrorbells      " don't beep
set autoindent        " make new lines keep current indentation
set hidden            " Navigate through buffers without vim whinings on unsaved buffers
set nofoldenable      " No folding

" Remember last location in file, but not for commit messages (see :help last-position-jump)
autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g`\"" | endif

" exit insert mode on write and focus lost
autocmd BufWrite,TabLeave * stopinsert

" Turn on filetype plugins (:help filetype-plugin)
filetype plugin indent on

""
"" Whitespace
""
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

""
"" List chars
""
set listchars=""                  " Reset the listchars
set listchars=tab:▸\              " a tab should display as "▸"
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=eol:¬              " show end of line as "¬"
set listchars+=extends:>          " The character to show in the last column when wrap is off and the line goes beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is off and the line goes beyond the left of the screen

""
"" Searching
""
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Ignore rails stuff
set wildignore+=data,tmp,vendor,log,script

""
"" Backup and swap files
""
set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

""
"" Status Line
""
set laststatus=2
set statusline=%<\ %f\ %m%r%y%=%30.([%l,%c]\ [%P]\ \ %)

""
"" Mappings
""
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
cmap w!! %!sudo tee > /dev/null %

" Y copies until the end of the line
nnoremap Y y$

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Kwbd mappings
map <leader>x :Kwbd<CR>

" NERDTree mappings
map <leader>n :NERDTreeToggle<CR>

" BufferGator mappings
nmap <leader>b :BuffergatorToggle<CR>

" Fugitive mappings
map <leader>gb :Gblame<CR>
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>

" Set ruby file type
map <leader>rf :set ft=ruby<CR>

" Map Command-# to switch tabs
map  <D-0> 0gt
imap <D-0> <Esc>0gt
map  <D-1> 1gt
imap <D-1> <Esc>1gt
map  <D-2> 2gt
imap <D-2> <Esc>2gt
map  <D-3> 3gt
imap <D-3> <Esc>3gt
map  <D-4> 4gt
imap <D-4> <Esc>4gt
map  <D-5> 5gt
imap <D-5> <Esc>5gt
map  <D-6> 6gt
imap <D-6> <Esc>6gt
map  <D-7> 7gt
imap <D-7> <Esc>7gt
map  <D-8> 8gt
imap <D-8> <Esc>8gt
map  <D-9> 9gt
imap <D-9> <Esc>9gt

""
"" Auto Strip
""
function! <SID>StripTrailingWhitespaces()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " Do the business:
        %s/\s\+$//e
        " Clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

""
"" Filetype
""
autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
autocmd BufNewFile,BufRead *.json set ft=javascript

""
"" Plugin settings
""

"" Buffergator
let g:buffergator_autoexpand_on_split = 0

""
"" Hook for customizations
""
if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
