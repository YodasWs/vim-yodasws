" Vim filetype plugin file
" Language:	JSON

func! s:eatchar(pat) abort
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" Fold JSON files
setlocal foldmethod=syntax foldcolumn=2 foldlevel=3

" Wrap text in double quotes
nnoremap <buffer> <localleader>" viw<Esc>a"<Esc>bi"<Esc>lel
vnoremap <buffer> <localleader>" <Esc>`>a"<Esc>`<i"<Esc>`>l

" f,a<CR><Esc>@n
" nnoremap <buffer> <localleader>n qnf,a<CR><Esc>qqN@nq@n
call setreg('n', "f,a\n")
call setreg('N', "@n")

" nnoremap <buffer> <localleader>c  :%s/,$\@!/,\n/g<CR>:%s/\([{\[]\)\(}\|\]\|$\)\@!/\1\n/g<CR>:%s/\(^\|\[\|{\|\s\)\@<!\(\]\|}\)/\n\2/g<CR>

" /\(^\|\s\|\[\|{\)\@<![\]}]
" ni<CR><Esc>@b
" call setreg('b', "ni\n")
" call setreg('B', "@b")
" nnoremap <buffer> <localleader>b1 :g/\(^\\|\s\\|\[\\|{\)\@<![\]}]/exe "normal! ni\n"<CR>

" /[\[{]\(]\|}\|$\)\@!
" na<CR><Esc>@b
" call setreg('b', "na\n")
" call setreg('B', "@b")
" nnoremap <buffer> <localleader>b2 :g/[\[{]\(]\\|}\\|$\)\@!/exe "normal! na\n"<CR>
