" Vim filetype plugin file
" Language:	MS-DOS Batch .bat/.cmd files

func! s:eatchar(pat) abort
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" Add/Remove Line Comment
nnoremap <buffer> <localleader>c v3l<Esc>I:: <Esc>`>
nnoremap <buffer> <localleader>C v3h<Esc>:s/^\(\s*\)::\s\?/\1/<CR>:nohlsearch<CR>`<

" Folding
setlocal foldmethod=marker
