" Vim syntax file
" Language: Markdown
" Maintainer: Sam Grundman (https://github.com/YodasWs)

" Syntax inside Code Blocks {{{1
" Fold Code Blocks
syn region markdownCodeBlock matchgroup=markdownCodeDelimiter start="^\s*\z(`\{3,\}\).*$" end="^\s*\z1\ze\s*$" keepend fold

" JavaScript {{{2
unlet b:current_syntax
syn include @mdJavascript syntax/javascript.vim
syn region mdJavascript matchgroup=markdownCodeDelimiter start="^\s*\z(`\{3,\}\)javascript\s*$"rs=e+1 end="^\s*\z1\ze\s*$"re=s-1 keepend fold contains=@mdJavascript

" JSON {{{2
unlet b:current_syntax
syn include @mdJson syntax/json.vim
syn region mdJson matchgroup=markdownCodeDelimiter start="^\s*\z(`\{3,\}\)json\s*$"rs=e+1 end="^\s*\z1\ze\s*$"re=s-1 keepend fold contains=@mdJson
