" markdown filetype file
au BufRead,BufNewFile *.{mmd}   set filetype=mmd

" have words that are seperated-by-dashes appear in decomplete; this is so
" that the references are picked up for links in the include_mmd_references
set iskeyword+=-
