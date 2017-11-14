" Vim filetype plugin file
" Language:	Vim
" Maintainer:	Sam Grundman <sam-vim@yodas.ws>

func! s:eatchar(pat) abort
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

" Add/Remove Line Comment
nnoremap <buffer> <localleader>c v2l<Esc>I" <Esc>`>
nnoremap <buffer> <localleader>C v2h<Esc>:s/^\(\s*\)"\s\?/\1/<CR>:nohlsearch<CR>`<

" Folding
setlocal foldmethod=marker
