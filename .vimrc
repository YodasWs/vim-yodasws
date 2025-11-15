" Options {{{1
" Search {{{2
set hlsearch incsearch ignorecase showcmd

" File Encoding {{{2
set encoding=utf-8 fileencoding=utf-8 nobomb
set fileformat=unix
if has("autocmd")
	aug ff
		au!
		au BufNewFile,BufRead * if ! &readonly | set fileformat=unix nobomb | endif
	aug END
endif

" Tab Preferences {{{2
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
let g:sass_recommended_style = 0

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

" Vim Diff {{{2
set diffopt+=filler,iwhite,vertical

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
set wildignorecase wildmenu wildmode=longest:full,full
set wildignore+=*~

" Session Options {{{2
set sessionoptions=buffers,curdir,folds,slash,tabpages,unix

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

" Windows OS {{{2
set guioptions-=tT
set mouse=

" Font {{{2
set guifont=Lucida_Console:h10:cANSI:qDRAFT

" Better diff in Ubuntu on Windows 10
hi DiffChange ctermfg=Black
hi DiffAdd ctermfg=Black

" Easier Commands {{{1
" Easier Command Typing {{{2
noremap ; :
noremap : ;

" Common Commands {{{2

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
	aug global
		au!
		" Maximize window
		au GUIEnter * simalt ~x
		" Go to last line
		au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" | exe "normal! g'\"" | endif
		" Flag that we're loading file from standard input
		au StdinReadPre * let s:std_in=1
	aug END

	" }}}2

	" Cursor Settings {{{2
	aug cursor
		au!
		" 1: Block cursor
		" 3: Underline cursor
		" 5: Vertical line cursor
		au VimEnter * silent !echo -ne "\e[1 q"
		au ModeChanged *:n silent !echo -ne "\e[1 q"
		au ModeChanged *:v silent !echo -ne "\e[3 q"
		au ModeChanged *:i silent !echo -ne "\e[5 q"
		au ModeChanged *:c silent !echo -ne "\e[5 q"
		au ModeChanged *:R silent !echo -ne "\e[3 q"
		au ModeChanged *:R set cursorlineopt=number
		au ModeChanged R:* set cursorlineopt=both | redraw
		au VimLeave * silent !echo -ne "\e[5 q"
	aug END
	" }}} 2
endif

" Digraphs {{{1
digraph H) 7722
digraph h) 7723

" Let us turn things on {{{1
filetype plugin indent on
syntax on
