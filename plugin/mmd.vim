" Create a function to save and write markdown to watching folder 


" Don't source the plug-in when it's already been loaded or &compatible is set.
if exists('g:loaded_mmd')
  finish
endif

" Turn Preview On 
function! MmdPreviewOn()
  silent Mmdtohtml
  silent ! open ~/.mmd-preview/markdown-preview.html 
  autocmd BufWritePost *.mmd Mmdtohtml
endfunction

" Use multimarkdown to produce html file  
function! MmdToHtml()
  silent ! mkdir -p ~/.mmd-preview 
  if !filereadable("~/.mmd-preview/mmd-meta-data-headers.mmd") 
    silent !cat ~/.mmd-preview/mmd-meta-data-headers.mmd > ~/.mmd-preview/markdown-preview.mmd 
    silent echo "\n" >>  ~/.mmd-preview/markdown-preview.mmd
  else
    silent !rm -f  ~/.mmd-preview/markdown-preview.mmd
  endif
  silent ! cat "%" >> ~/.mmd-preview/markdown-preview.mmd
  silent ! multimarkdown ~/.mmd-preview/markdown-preview.mmd > ~/.mmd-preview/markdown-preview.html
endfunction

" Remove all WritePost autocommands for mmd files
function! MmdAutoOff()
  autocmd! BufWritePost *.mmd 
endfunction

" Create repective commands
call MmdAutoOff()
command! -nargs=* Mmdtohtml call MmdToHtml()
command! -nargs=* Mmdpreviewon call MmdPreviewOn()
command! -nargs=* Mmdpreviewoff call MmdAutoOff()

" Make sure the plug-in is only loaded once.
let g:loaded_mmd= 1

