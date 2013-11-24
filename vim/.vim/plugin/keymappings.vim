


" Ignore  F1
"inoremap <F1> <ESC>
"nnoremap <F1> <ESC>
"vnoremap <F1> <ESC>

" Toggle paste mode
set pastetoggle=<F2>
" Toggle line number types
nnoremap <F4> :call ToggleNumber()<CR>
" Repeat last command
map <F8> @:
"reformat file
map <F7> mzgg=G`z<CR>


func! KeyMappings_Markdown()
	nnoremap <F5> :call PreviewMarkdown()<CR> 
endfunc

func! KeyMappings_Go()
	nnoremap <F5> :TxRun<CR>
endfun

function! RepeatChar(char, count)
    return repeat(a:char, a:count)
endfunction

fun! ToggleNumber() "{{{
    if exists('+relativenumber')
        :exec &nu==&rnu? "setl nu!" : "setl rnu!"
    else
        setl nu! 
    endif
endf "}}}

autocmd FileType go call KeyMappings_Go()
autocmd FileType markdown call KeyMappings_Markdown()
