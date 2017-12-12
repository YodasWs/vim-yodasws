" Vim syntax file
" Language: HTML
" Maintainer: "Samuel B Grundman" <sam+vim@yodas.ws>
" Filenames: *.html

" Obsolete Tags {{{1
syn match   htmlTagN     contained +<\s*[-a-zA-Z0-9]\++hs=s+1 contains=htmlTagName,htmlSpecialTagName,@htmlTagNameCluster,htmlTagNameError
syn match   htmlTagN     contained +</\s*[-a-zA-Z0-9]\++hs=s+2 contains=htmlTagName,htmlSpecialTagName,@htmlTagNameCluster,htmlTagNameError
syn keyword htmlTagErrorName contained center acronym blink font marquee
" }}}1

" SVG {{{1
unlet b:current_syntax
syn include @htmlSvg syntax/svg.vim
syn region  htmlSvg start=+<svg\_[^>]*>+ keepend end=+</svg\_[^>]*>+ contains=@htmlSvg,htmlArg,htmlValue

hi def link svgTag htmlTag
hi def link svgEnd htmlTag
hi def link htmlSvg Normal
" }}}1

" Highlight {{{1
if !exists("html_no_rendering")
	hi def link htmlTagErrorName Error
endif
" }}}1
