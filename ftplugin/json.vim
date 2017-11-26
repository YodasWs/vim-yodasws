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
