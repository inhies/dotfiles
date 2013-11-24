if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead .vimperatorrc setf vimperator
augroup END
