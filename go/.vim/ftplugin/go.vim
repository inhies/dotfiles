autocmd! BufWritePre *.go Fmt
autocmd FileType go compiler golang
let g:golang_goroot = '/usr/lib/go'

setlocal formatoptions-=t
setlocal smartindent          
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
"setlocal noexpandtab          
"setlocal spell spelllang=en_us
"set complete+=s              
"setlocal formatprg=par\ -w80\ -g1 
"setlocal textwidth=80
setlocal colorcolumn=80	
function! s:GoLint()
    cexpr system("golint " . shellescape(expand('%')))
    copen
  endfunction
  command! GoLint :call s:GoLint()
setlocal number
