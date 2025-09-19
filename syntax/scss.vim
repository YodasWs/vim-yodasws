" Vim syntax file
" Language: SCSS
" Maintainer: Sam Grundman
" Repo: https://github.com/YodasWs/vim-yodasws
" Filenames: *.scss

syn region sassInclude start="@use" end=";\|$" contains=scssComment,cssStringQ,cssStringQQ,cssURL,cssUnicodeEscape,cssMediaType
