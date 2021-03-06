""
"" Load Vundle
""
"" from https://github.com/VundleVim/Vundle.vim#quick-start
""
set nocompatible              " be iMproved, required by vundle
filetype off                  " required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'rgarver/Kwbd.vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'scrooloose/nerdtree'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'edsono/vim-matchit'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'groenewege/vim-less'
Plugin 'rodjek/vim-puppet'
Plugin 'digitaltoad/vim-jade'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'fatih/vim-go'
Plugin 'chase/vim-ansible-yaml'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'leafgarland/typescript-vim'
Plugin 'hashivim/vim-terraform'
Plugin 'elixir-lang/vim-elixir'
Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'edkolev/tmuxline.vim'
Plugin 'jparise/vim-graphql'

call vundle#end()            " required by vundle
filetype plugin indent on    " required by vundle

""
"" Basic Setup
""
colorscheme solarized
set background=dark   " Prefer dark background schema
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
set nolist                        " Hide invisible characters
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
set backupdir=~/.vim/_backup/    " where to put backup files.
set noswapfile                   " disable swap files.

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

" UltiSnips
map <leader>s :UltiSnipsEdit<CR>

" Map Command-# and Leader-# to switch tabs
map  <D-0> 0gt
imap <D-0> <Esc>0gt
map  <leader>0 0gt
map  <D-1> 1gt
imap <D-1> <Esc>1gt
map  <leader>1 1gt
map  <D-2> 2gt
imap <D-2> <Esc>2gt
map  <leader>2 2gt
map  <D-3> 3gt
imap <D-3> <Esc>3gt
map  <leader>3 3gt
map  <D-4> 4gt
imap <D-4> <Esc>4gt
map  <leader>4 4gt
map  <D-5> 5gt
imap <D-5> <Esc>5gt
map  <leader>5 5gt
map  <D-6> 6gt
imap <D-6> <Esc>6gt
map  <leader>6 6gt
map  <D-7> 7gt
imap <D-7> <Esc>7gt
map  <leader>7 7gt
map  <D-8> 8gt
imap <D-8> <Esc>8gt
map  <leader>8 8gt
map  <D-9> 9gt
imap <D-9> <Esc>9gt
map  <leader>9 9gt

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
autocmd BufNewFile,BufRead *.es6 set ft=javascript

""
"" Plugin settings
""

"" Buffergator
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_suppress_keymaps = 1

"" NERDCommenter
let g:NERDSpaceDelims = 1      " add space to the right of the comment delimiter

"" NERDTree
let NERDTreeMinimalUI = 1"

"" Airline
let g:airline_powerline_fonts=1

"" UltiSnips
let g:UltiSnipsEditSplit="vertical"

"" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"

"" vim-jsx
let g:jsx_ext_required = 0

"" neocomplete
set completeopt-=preview
" let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_at_startup = 1

""
"" Hook for customizations
""
if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
