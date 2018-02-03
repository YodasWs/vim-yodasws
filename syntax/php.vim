" Vim syntax file
" Language: PHP
" Maintainer: "Samuel B Grundman" <sam+vim@yodas.ws>
" Filenames: *.php

" PHP 5.1.2 Updates
syn keyword phpFunctions contained hash hash_algos hash_copy hash_equals hash_file hash_final hash_hmac hash_hmac_file hash_init hash_pbkdf2 hash_update hash_update_file hash_update_stream

" PHP 5.2 Updates
syn keyword phpFunctions contained json_encode json_decode filter_var

" PHP 5.3 Updates
syn keyword phpStructure contained namespace
