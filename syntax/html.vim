" Vim syntax file
" Language: HTML
" Maintainer: "Samuel B Grundman" <sam+vim@yodas.ws>
" Filenames: *.html

" Obsolete Tags
syn keyword htmlTagError contained center acronym blink font marquee

" HTML5
syn keyword htmlTagName contained article aside figcaption figure footer header main nav section time
syn keyword htmlTagName contained details mark menu menuitem meter output summary
syn keyword htmlTagName contained audio embed picture source track video
syn keyword htmlTagName contained ruby rp rt
syn keyword htmlTagName contained bdi wbr datalist keygen svg canvas
syn keyword htmlArg contained autocomplete autofocus placeholder list
syn keyword htmlArg contained min max multiple pattern
syn keyword htmlArg contained required spellcheck novalidate
syn keyword htmlArg contained form formnovalidate formaction formenctype formmethod formtarget
