" Vim filetype plugin file
" Language:	Javascript

func! s:eatchar(pat) abort
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" Syntax Code Completion
iabbrev <silent> <buffer> if if (<C-R>=<SID>eatchar('\s')<CR>
iabbrev <silent> <buffer> while while (<C-R>=<SID>eatchar('\s')<CR>
iabbrev <silent> <buffer> do do {} while ();<Esc>F}i<CR><Esc>O<C-R>=<SID>eatchar('\s')<CR>
iabbrev <silent> <buffer> switch switch (<C-R>=<SID>eatchar('\s')<CR>

" Wrap text in single quotes
nnoremap <buffer> <localleader>' viw<Esc>a'<Esc>bi'<Esc>lel
vnoremap <buffer> <localleader>' <Esc>`>a'<Esc>`<i'<Esc>`>l

" Add/Remove Line Comment
nnoremap <buffer> <localleader>c m<m><Esc>I// <Esc>`>
nnoremap <buffer> <localleader>C m<m><Esc>:s/^\(\s*\)\/\/\s\?/\1/<CR>:nohlsearch<CR>`<

" Select text in next/last parentheses
onoremap <buffer> in( :<C-u>normal! f(vi(<CR>
onoremap <buffer> il( :<C-u>normal! F)vi(<CR>
