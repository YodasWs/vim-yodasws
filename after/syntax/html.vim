" Vim syntax file
" Language: HTML
" Maintainer: "Samuel B Grundman" <sam+vim@yodas.ws>
" URL: http://yodas.ws
" Filenames: *.html
" Last Change: 12 Jun 2017

" Obsolete Tags
syn match   htmlTagN     contained +<\s*[-a-zA-Z0-9]\++hs=s+1 contains=htmlTagName,htmlSpecialTagName,@htmlTagNameCluster,htmlTagNameError
syn match   htmlTagN     contained +</\s*[-a-zA-Z0-9]\++hs=s+2 contains=htmlTagName,htmlSpecialTagName,@htmlTagNameCluster,htmlTagNameError
syn keyword htmlTagErrorName contained center acronym blink font marquee

" Highlight
command! -nargs=+ HiLink hi def link <args>
if !exists("html_no_rendering")
	HiLink htmlTagErrorName Error
endif
delcommand HiLink
