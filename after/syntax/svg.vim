" Vim syntax file
" Language: SVG (Scalable Vector Graphics)
" Maintainer: Samuel B Grundman (https://github.com/YodasWs)
" File Types: .svg (used in Web and vector programs)

" JavaScript {{{1
unlet b:current_syntax
syn include @svgJavaScript syntax/javascript.vim
syn region  javaScript start=+<script\_[^>]*>\_s*<!\[CDATA\[+ keepend end=+]]>\_s*</script\_[^>]*>+ contains=svgScriptTag,@svgJavaScript,xmlAttrib,svgScriptEnd

syn match svgScriptTag +<script\_[^>]*>\_s*<!\[CDATA\[+ contained nextgroup=@svgJavaScript
syn match svgScriptEnd +]]>\_s*</script\_[^>]*>+ contained

hi def link svgScriptTag xmlTag
hi def link svgScriptEnd xmlTag
hi def link javaScript Normal
" }}}1

" CSS {{{1
unlet b:current_syntax
syn include @svgCSS syntax/css.vim
syn region  css start=+<style\_[^>]*>\_s*<!\[CDATA\[+ keepend end=+]]>\_s*</style\_[^>]*>+ contains=svgStyleTag,@svgCSS,xmlAttrib,svgStyleEnd

syn match svgStyleTag +<style\_[^>]*>\_s*<!\[CDATA\[+ contained nextgroup=@svgCSS
syn match svgStyleEnd +]]>\_s*</script\_[^>]*>+ contained

hi def link svgStyleTag xmlTag
hi def link svgStyleEnd xmlTag
hi def link css Normal
" }}}1

let b:current_syntax = "svg"
