if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

" Display occurrences of current word in quickfix window
" consider <Leader>q for "quick"?
nnoremap <Leader>sw :execute "vimgrep " . expand("<cword>") . " %"<CR>:copen<CR>
" … and last search
nnoremap <Leader>ss :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Quickfix maps {{{
nmap <Leader>cwc :cclose<CR>
nmap <Leader>cwo :copen 7<CR><C-w>p
nmap <Leader>cn :cnext<CR>
nmap <Leader>cp :cprevious<CR>
nmap <M-Down> :cnext<CR>
nmap <M-Up> :cprevious<CR>
nmap <Leader>cr :crewind<CR>
nmap <Leader>cl :clast<CR>
" }}}
