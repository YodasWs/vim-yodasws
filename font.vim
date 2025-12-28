" Clearn old syntax rules
try
  syntax clear Greek
  syntax clear GreekComment
  syntax clear Hanguel
  syntax clear HanguelComment
  syntax clear Cyrillic
  syntax clear CyrillicComment
catch
endtry

" Set "normal" font
set guifont=FixedSys:h7:cDEFAULT
set guifontwide=Lucida_Console:h9

" Define character ranges for various scripts
syntax match Hanguel +[\u1100-\u11ff\u3131-\u318e\uac00-\ud7a3]+
syntax match HanguelComment +[\u1100-\u11ff\u3131-\u318e\uac00-\ud7a3]+ containedin=.*Comment

syntax match Greek +[\u0370-\u03ff\u1f00-\u1fff]+
syntax match GreekComment +[\u0370-\u03ff\u1f00-\u1fff]+ containedin=.*Comment
syntax match GreekCursor +[\u0370-\u03ff\u1f00-\u1fff]+ containedin=Cursor

syntax match Cyrillic "[\u0400-\u04ff\u0500-\u052f]"
syntax match CyrillicComment "[\u0400-\u04ff\u0500-\u052f]" containedin=.*Comment

"Reset highlighting rules
highlight Hanguel NONE
highlight HanguelComment NONE

highlight Greek NONE
highlight GreekComment NONE

highlight Cyrillic NONE
highlight CyrillicComment NONE

highlight Hanguel guibg=Red
highlight HanguelComment guifg=Blue

highlight Greek font=Courier_New:h9
highlight GreekComment guifg=Blue font=Courier_New:h9
highlight GreekCursor font=Courier_New:h9

highlight Cyrillic font=Courier_New:h10
highlight CyrillicComment guifg=Blue font=Courier_New:h10

" ãæā↷내
" этот
" θtheta
