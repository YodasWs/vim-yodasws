" Vim syntax file
" Language: CSS
" Maintainer: "Samuel B Grundman" <sam+vim@yodas.ws>
" Filenames: *.css

" Don't run this file again!
if exists("b:current_syntax")
	finish
endif
if exists("b:local_css")
	finish
endif
let b:local_css = 1

" Need base CSS rules first
runtime! syntax/css.vim

unlet b:local_css

""""""""""""""""""""""""""
" Fixup Vim's CSS Syntax "
syn match cssProp contained "\<text-indent:"he=e-1

"""""""""""""""""
" Media Queries "
" https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries
" https://developer.mozilla.org/en-US/docs/Web/CSS/@media

" Build Media Query Rule
syn match cssMedia "@media\>" contained
syn region cssMediaQueryList start="@media\>"hs=s end="[^#]{\@=" contains=cssMedia,cssMediaType,cssMediaError,cssMediaExp,cssMediaNot,cssMediaAnd,cssMediaComma,sassVariable nextgroup=cssMediaBlock skipwhite skipnl
syn region cssMediaBlock transparent matchgroup=cssBraces start='{' end='}' contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssTagName,cssClassName,cssIdentifier,cssPseudoClass,cssSelectorOp,cssSelectorOp2,cssAttributeSelector fold skipwhite skipnl

syn match cssMediaComma "," nextgroup=cssMediaType,cssMediaNot,cssMediaError,cssMediaExp skipwhite skipnl
syn keyword cssMediaAnd contained and nextgroup=cssMediaExp,cssMediaNot skipwhite skipnl
syn keyword cssMediaNot contained not nextgroup=cssMediaExp,cssMediaType,cssMediaError skipwhite skipnl
syn keyword cssMediaType contained screen print speech all nextgroup=cssMediaComma,cssMediaAnd skipwhite skipnl

syn region cssMediaExp contained start="(" end=")" contains=cssMediaFeat,cssMediaError,cssValue.* oneline

syn keyword cssMediaFeat contained scan grid orientation
syn match cssMediaFeat contained "\<\(\(max\|min\)-\)\=\(\(width\|height\|aspect-ratio\)\|color\(-index\)\=\|monochrome\|resolution\)\>"
syn match cssMediaFeat contained "\<\(any-\)\=\(pointer\|hover\)\>"
syn match cssMediaFeat contained "\<display-mode\>"
" CSS 4
syn keyword cssMediaFeat contained scripting
syn match cssMediaFeat contained "\<\(light-level\|inverted-colors\|update-frequency\)\>"
syn match cssMediaFeat contained "\<overflow-\(inline\|block\)\>"

syn keyword cssValueMedia contained landscape portrait

""""""""""
" HTML 5 "

syn keyword cssTagName article aside audio bdi canvas command data
syn keyword cssTagName datalist details dialog embed figcaption figure footer
syn keyword cssTagName header keygen main mark menu menuitem meter nav
syn keyword cssTagName output picture progress rt rp ruby section
syn keyword cssTagName source summary time track video wbr

"""""""""""""""""""
" CSS3 Properties "

syn keyword cssProp contained transition transform opacity resize
syn match cssProp contained "\<animation\(-\(direction\|delay\|duration\|fill-mode\|iteration-count\|name\|play-state\|timing-function\)\)\=\>"
syn match cssProp contained "\<column\(s\|-\(width\|count\)\)\>:"he=e-1

"""""""""""""""
" CSS3 Values "

syn keyword cssCommonAttr contained initial unset
syn match cssAttr contained "\<\(border\|padding\|content\)-box\>"
syn match cssAttr contained "\<\(min\|max\|fit\)-content\>"
syn keyword cssAttr contained available
syn match cssValueLength contained "[-+]\=\d\+\(\.\d*\)\=\(%\|mm\|cm\|in\|pt\|pc\|em\|ex\|px\|ch\|rem\|dpi\|dppx\|dpcm\|vh\|vw\|vmin\|vmax\)\>" contains=cssUnitDecorators

"""""""""""
" Cursors "
syn keyword cssAttr contained progress cell text vertical-text alias copy move
syn match cssAttr contained "\<\(col\|row\|[nswe]\|[ns][ew]\|nesw\|nwse\)-resize\>"
syn match cssAttr contained "\<\(zoom-\(in\|out\)\|grab\(bing\)\=\|context-menu\|no-drop\|not-allowed\|all-scroll\)\>"

"""""""""""
" Flexbox "
syn match cssAttr contained "\<flex\(-\(start\|end\)\)\=\>"
syn match cssProp contained "\<flex\(-\(basis\|direction\|flow\|grow\|shrink\|wrap\)\)\=\>:"he=e-1
syn match cssProp contained "\<\(order\|justify-content\|align-\(items\|content\|self\)\|box-sizing\)\>:"he=e-1
syn match cssAttr contained "\<\(stretch\|space-\(around\|between\)\)\>"
syn keyword cssAttr contained column row wrap

"""""""""""""
" @Supports "

syn match cssSupports "@supports\>" nextgroup=cssSupportsCheck,cssSupportsNot
syn region cssSupportsList start="@supports\>"hs=s end="[^#]{\@=" contains=cssSupports,cssSupportsCheck,cssSupportsNot,cssSupportsAnd,cssSupportsOr,sassVariable nextgroup=cssBlock skipwhite skipnl
syn region cssSupportsCheck contained start="(" end=")" contains=css.*Attr,css.*Prop,cssPrototype,cssColor,cssColorFunction,cssURL,cssStringQ,cssStringQQ,cssFunction oneline nextgroup=cssBlock,cssSupportsAnd,cssSupportsOr skipwhite skipnl
syn keyword cssSupportsOr  contained or  nextgroup=cssSupportsCheck,cssSupportsNot
syn keyword cssSupportsAnd contained and nextgroup=cssSupportsCheck,cssSupportsNot
syn keyword cssSupportsNot contained not nextgroup=cssSupportsCheck

"""""""""""""""""""""""""
" Regions/Pages/Columns "

syn keyword cssProp contained orphans widows
syn match cssProp contained "\<\(page-\)\=break-\(before\|after\|inside\):"he=e-1
syn match cssAttr contained "\<avoid\(-\(page\|column\|region\)\)\=\>"
syn keyword cssAttr contained recto verso page column region

"""""""""""
" Columns "
syn match cssProp contained "\<column\(s\|-\(count\|width\|fill\|rule\(-\(style\|color\|width\)\)\=\|gap\|span\)\):"he=e-1
syn keyword cssAttr contained balance

"""""""""""""""
" Grid Layout "
syn match cssProp contained "\<grid\(-\(area\|auto-\(columns\|flow\|rows\)\|\(row\|column\)\(-\(end\|gap\|start\)\)\=\|gap\|template\(-\(areas\|columns\|rows\)\)\=\)\)\=\>:"he=e-1
syn match cssAttr contained "\<auto-flow\>"
syn keyword cssAttr contained dense

"""""""""""""""""""""""
" Text Module Level 3 "
syn keyword cssProp contained hyphens
syn match cssProp contained "\<\(text-align-\(all\|last\)\|overflow-wrap\|line-break\|tab-size\)\>"
syn keyword cssAttr contained start end left right

""""""""""""""""""
" Pseudo-Classes "

syn match cssPseudoClass ":\@<!:[a-z-]\+" contains=cssPseudoClassId,cssPseudoClassLang,cssPseudoClassFunc,cssUnicodeEscape
syn keyword cssPseudoClassId contained link visited active hover focus
syn keyword cssPseudoClassId contained checked default disabled fullscreen empty enabled indeterminate in-range invalid optional out-of-range required root scope target valid
syn match cssPseudoClassId contained "\<read-\(only\|write\)\>"
syn region cssPseudoClassLang contained matchgroup=cssPseudoClassId start="lang(" end=")" oneline
syn match cssPseudoClassId contained "\<\(first\|last\|only\)-\(of-type\|child\)\>"
syn match cssPseudoClassId contained "\<\(nth\|nth-last\)-\(of-type\|child\)(\(\([-]\=\d*n\)\|[-]\=\d\+\|\(\d*n\)\s*\(+\|- \)\s*[-]\=\d\+\))"
syn region cssPseudoClassFunc contained matchgroup=cssPseudoClassId start="\(dir\|match\|not\)(" end=")" oneline

"""""""""""""""""""
" Pseudo-Elements "

syn match cssPseudoElement "::\S*" contains=cssPseudoElementId,cssUnicodeEscape
syn keyword cssPseudoElementId contained before after
syn match cssPseudoElementId contained "\<first-\(line\|letter\)\>"

syn match cssError ":\@<!:\(before\|after\|first-\(line\|letter\)\)"

""""""""""""""""""""""""""
" CSS Prototype Prefixes "

syn match cssPrototype contained "\(-\(webkit\|moz\|ms\|o\)-\)" nextgroup=css.*Attr,css.*Prop

""""""""""""""
" New Colors "
" https://github.com/vim/vim/blob/master/runtime/syntax/css.vim

syn keyword cssColor contained aliceblue antiquewhite aquamarine azure
syn keyword cssColor contained beige bisque blanchedalmond blueviolet brown burlywood
syn keyword cssColor contained cadetblue chartreuse chocolate coral cornflowerblue cornsilk crimson cyan
syn match cssColor contained "\<dark\(blue\|cyan\|goldenrod\|gray\|green\|grey\|khaki\)\>"
syn match cssColor contained "\<dark\(magenta\|olivegreen\|orange\|orchid\|red\|salmon\|seagreen\)\>"
syn match cssColor contained "\<darkslate\(blue\|gray\|grey\)\>"
syn match cssColor contained "\<dark\(turquoise\|violet\)\>"
syn keyword cssColor contained deeppink deepskyblue dimgray dimgrey dodgerblue firebrick
syn keyword cssColor contained floralwhite forestgreen gainsboro ghostwhite gold
syn keyword cssColor contained goldenrod greenyellow grey honeydew hotpink
syn keyword cssColor contained indianred indigo ivory khaki lavender lavenderblush lawngreen
syn keyword cssColor contained lemonchiffon limegreen linen magenta
syn match cssColor contained "\<light\(blue\|coral\|cyan\|goldenrodyellow\|gray\|green\)\>"
syn match cssColor contained "\<light\(grey\|pink\|salmon\|seagreen\|skyblue\|yellow\)\>"
syn match cssColor contained "\<light\(slategray\|slategrey\|steelblue\)\>"
syn match cssColor contained "\<medium\(aquamarine\|blue\|orchid\|purple\|seagreen\)\>"
syn match cssColor contained "\<medium\(slateblue\|springgreen\|turquoise\|violetred\)\>"
syn keyword cssColor contained midnightblue mintcream mistyrose moccasin navajowhite
syn keyword cssColor contained oldlace olivedrab orange orangered orchid
syn match cssColor contained "\<pale\(goldenrod\|green\|turquoise\|violetred\)\>"
syn keyword cssColor contained papayawhip peachpuff peru pink plum powderblue
syn keyword cssColor contained rosybrown royalblue saddlebrown salmon sandybrown
syn keyword cssColor contained seagreen seashell sienna skyblue slateblue
syn keyword cssColor contained slategray slategrey snow springgreen steelblue tan
syn keyword cssColor contained thistle tomato turquoise violet wheat
syn keyword cssColor contained whitesmoke yellowgreen

""""""""""""""
" New Colors "
syn keyword cssColor contained rebeccapurple

""""""""""""""""""""""""""""""""
" Generic CSS Block for @rules "
syn region cssBlock transparent matchgroup=cssBraces start='{' end='}'

"""""""""""""""""""""
" Obsolete Items    "
" DO NOT USE IN CSS "

" HTML
syn keyword cssError acronym applet blink marquee
syn match cssError "\<font[-:]\@!"

" Media Queries
syn keyword cssMediaError contained aural braille embosed handheld only projection tv tty
syn match cssMediaError contained "\<\(\(max\|min\)-\)\=device-\(width\|height\|aspect-ratio\)\>"

""""""""""""""""""""""""""""""""""""""
" Updated and New Highlighting Rules "
if version >= 508
	command -nargs=+ HiLink hi def link <args>
	HiLink cssPrototype Identifier
	HiLink cssObsolete Error
	HiLink cssError Error
	HiLink cssMedia atRule
	HiLink cssMediaExp Delimiter
	HiLink cssMediaType Type
	HiLink cssMediaComma Normal
	HiLink cssMediaFeat StorageClass
	HiLink cssMediaAnd PreProc
	HiLink cssMediaNot PreProc
	HiLink cssMediaError Error
	HiLink cssProp StorageClass
	HiLink cssAttr Type
	HiLink cssSupports atRule
	HiLink cssSupportsOr Keyword
	HiLink cssSupportsAnd Keyword
	HiLink cssSupportsNot Keyword
	HiLink cssPseudoClassId PreProc
	HiLink cssPseudoClassLang PreProc
	HiLink cssPseudoClassFunc PreProc
	HiLink cssPseudoElementId PreProc
	HiLink atRule Special
	delcommand HiLink
endif
