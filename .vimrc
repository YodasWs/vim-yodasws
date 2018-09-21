" Let us turn things on {{{1
filetype plugin indent on
syntax on

" Options {{{1
" Search {{{2
set hlsearch incsearch ignorecase

" File Encoding {{{2
set encoding=utf-8 fileencoding=utf-8 nobomb
set fileformat=unix
if has("autocmd")
  aug ff
    au!
    " au BufRead * if ! &readonly | set fileformat=unix nobomb
  aug END
endif

" Tab Preferences {{{2
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Vim Reading {{{2
set number
set wrap
set foldmethod=manual foldcolumn=0
set autoindent smartindent
set scrolloff=5
set cursorline

" Vim Editing {{{2
set backspace=indent,eol,start
set formatoptions+=cqo12rj
set formatoptions-=t
set nojoinspaces

" Vim Tabs {{{2
set showtabline=2
" set switchbuf=usetab,newtab

" Vim Buffers {{{2
set confirm
nnoremap <Leader>b :ls<CR>:b<Space>
set hidden
set splitright splitbelow

" Switch between Vim Windows {{{2
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Vim Tab-complete {{{2
set wildmenu wildmode=longest:full,full

" Session Options {{{2
set sessionoptions=buffers,curdir,folds,slash,tabpages,unix,winpos,winsize

" Set up keyboard shortcuts to open/save session files
if has("autocmd")
  aug sessions
    au!
    au VimEnter * call VimEnter()
  aug END
endif

function! VimEnter()
  if has("browse") == 1
    let g:SessionFileName=""
    nnoremap <silent> <F4> :let g:SessionFileName=browse(0, "Select Session", "$VIM/vimfiles/sessions/", "") <CR>:if g:SessionFileName != ""<CR>exe "source " . g:SessionFileName<CR>endif<CR><CR>
    nnoremap <C-F4> :browse mks! $VIM/vimfiles/sessions/<CR>
    nnoremap <C-S-F4> :exe "mks! " . g:SessionFileName<CR>
  endif
endfunction

" Windows {{{2
set guioptions-=tT
set mouse=

" Easier command typing {{{1
noremap ; :
noremap : ;

" Common Commands {{{1

" Git Merge Conflicts
nnoremap <C-N> /^\(<<<<<<<\\|=======\\|>>>>>>>\)<CR>

" Search for Visually-selected Text
vnoremap <silent> // :<C-U><ESC>gvy/<C-R><C-R>=escape(@",'\')<CR><CR>gV

" Destroy Trailing Whitespace
nnoremap <Leader>w :%s/\s\+$//g<CR>:nohlsearch<CR>

" Join Lines
nnoremap <Leader>j @='Jx'<CR>

" Autocommands {{{1
if has("autocmd")
  " Global Settings {{{2
  au!
  " Maximize window
  au GUIEnter * simalt ~x
  " Go to last line
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" | exe "normal! g'\"" | endif
  " Flag that we're loading file from standard input
  au StdinReadPre * let s:std_in=1

  " }}}2
endif
