" Vim syntax file
" Language: HTML
" Maintainer: Samuel B Grundman (https://github.com/YodasWs)

" SVG {{{1
unlet b:current_syntax
syn include @htmlSvg syntax/svg.vim
syn region htmlSvg start=+<svg\_[^>]*>+ keepend end=+</svg\_[^>]*>+ fold contains=@htmlSvg

" Obsolete HTML {{{1
" Obsolete Tags {{{2
syn keyword htmlTagNameError contained containedin=htmlTagN acronym applet basefont big center font strike
syn keyword htmlTagNameError contained containedin=htmlTagN frame noframes frameset nobr
syn keyword htmlTagNameError contained containedin=htmlTagN layer ilayer nolayer spacer
syn keyword htmlTagNameError contained containedin=htmlTagN blink marquee tt xmp

" Obsolete Attributes {{{2
syn match   htmlArgError contained "\<margin\(bottom\|height\|left\|right\|top\|width\)\>"
syn keyword htmlArgError contained align alink background cellspacing rev

" HTML5 {{{1
syn keyword htmlTagName contained article aside figcaption figure footer header main nav section time
syn keyword htmlTagName contained details mark menu menuitem meter output summary
syn keyword htmlTagName contained audio embed picture source track video
syn keyword htmlTagName contained ruby rp rt
syn keyword htmlTagName contained bdi wbr datalist keygen svg canvas
syn keyword htmlArg contained autocomplete autofocus placeholder list
syn keyword htmlArg contained min max multiple pattern
syn keyword htmlArg contained required spellcheck novalidate
syn keyword htmlArg contained form formnovalidate formaction formenctype formmethod formtarget
syn match   htmlArg contained "\<data-[0-9A-Za-z-]\+"

" Microdata {{{1
syn keyword htmlArg contained itemscope itemprop itemtype

" Highlight {{{1
hi def link htmlTagNameError Error
