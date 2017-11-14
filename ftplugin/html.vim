" Vim filetype plugin file
" Language:	HTML

func! s:eatchar(pat) abort
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" Replace -- with em dash
iabbrev <silent> <buffer> -- &mdash;<C-R>=<SID>eatchar('\s')<CR>

" Wrap text in double quotes
nnoremap <buffer> <localleader>" viw<Esc>a"<Esc>bi"<Esc>lel
vnoremap <buffer> <localleader>" <Esc>`>a"<Esc>`<i"<Esc>`>l
