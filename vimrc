set nocompatible

" Highlight characters behind the 80 chars margin
" :au BufWinEnter * let w:m2=matchadd('ColumnMargin', '\%>80v.\+', -1)

call pathogen#infect()
call pathogen#helptags()

set backup
set directory=~/.vim_swaps
set backupdir=~/.vim_backup
if exists("&undodir")
	set undodir=~/.vim/undo
endif
set writebackup
" keep 150 lines of command line history
set history=150
" show the cursor position all the time
set ruler
" display incomplete commands
set showcmd
" do incremental searching
set incsearch
set number
set gcr=n-v-c:block-Cursor/block-Cursor-blinkwait300-blinkon200-blinkoff0,i-ci:ver30-block-Cursor-blinkwait300-blinkon200-blinkoff0

" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Highlight current line
"set cursorline
" Enable mouse in all modes
set mouse=a
" Don’t reset cursor to start of line when moving around.
set nostartofline

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
" set list listchars=tab:»·,trail:·

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
syntax on
set hlsearch
endif

set laststatus=2

" colorscheme skoehlerautumn
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4

" Use Ack instead of Grep when available
if executable("ack")
set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"  autocmd BufReadPost *
"    \ if line("'\"") > 0 && line("'\"") <= line("$") |
"   \   exe "normal g`\"" |
"   \ endif
"
augroup END

else

set autoindent    " always set autoindenting on

endif
" has("autocmd")

if has("folding")
set foldenable
set foldmethod=syntax
set foldlevel=1
set foldnestmax=2
set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
endif

set guifont=Menlo:h12

" change default mapleader from \ to ,
let mapleader = ","

" replace ack with ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" NERDTree
map <C-n> :NERDTreeToggle<CR>

