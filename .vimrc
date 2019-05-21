set nocompatible                  " Must come first because it changes other options.
filetype off                      " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-powerline'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'othree/yajs.vim'
Plugin 'othree/html5.vim'
Plugin 'mhartington/oceanic-next'

let g:vim_jsx_pretty_colorful_config = 1

" All of your Plugins must be added before the following line
call vundle#end()                 " required
filetype plugin indent on         " required

syntax enable                     " Turn on syntax highlighting.

"NERD TREE - show on opening vim automatically
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() |  NERDTree | endif
let NERDTreeShowHidden=1

" ignore the following patterns in ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|coverage'

set encoding=utf-8

set mouse=a                       " Enable Mouse

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp      " Keep swap files in one location

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set cursorline
set ai
set ts=2
set softtabstop=2

set showmatch                    " show matching brackets
set mat=5                        " Bracket blinking
set list

"Set line endings to show as ¬ instead of $ when viewing in :set list mode
set lcs=eol:¬

" Highlight 80 character column
highlight ColorColumn ctermbg=4
set colorcolumn=80

"highlight extra white space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set laststatus=2                  " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" set region to British English
set spelllang=en_gb

" color settings
set t_Co=256
syntax on
colorscheme OceanicNext
let g:oceanic_next_terminal_bold = 1

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" \f to find file
map <leader>f :CtrlP<cr>
" \p to paste
map <leader>p :r!pbpaste<cr>

set wildmode=longest,list
set wildmenu "enable bash <tab><tab> to list dir

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Turn syntax highlighting on
if (has("gui_running"))
  syntax on
  if has("gui_macvim")
    set guifont=Menlo:h16
  endif
end

" CTRL + n = remove blank space at the end of lines
nnoremap <silent> <C-n> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

au BufRead,BufNewFile *.ui set filetype=ruby
au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile *.pjax.erb set filetype=html
au BufRead,BufNewFile *.mustache set filetype=javascript
au BufNewFile,BufRead *.ctp set filetype=html
au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead Rakefile set filetype=ruby
au BufNewFile,BufRead Fudgefile set filetype=ruby
au BufRead,BufNewFile *.md set filetype=markdown

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
