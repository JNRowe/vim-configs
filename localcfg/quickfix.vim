if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

nnoremap [quickfix] <Nop>
nmap <Leader>f [quickfix]

" Display occurrences of current word in quickfix window
nnoremap [quickfix]sw :execute "vimgrep " . expand("<cword>") . " %"<CR>:copen<CR>
" … and last search
nnoremap [quickfix]ss :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

nmap [quickfix]wc :cclose<CR>
nmap [quickfix]wo :copen 7<CR><C-w>p
nmap [quickfix]n :cnext<CR>
nmap [quickfix]p :cprevious<CR>
nmap <M-Down> :cnext<CR>
nmap <M-Up> :cprevious<CR>
nmap [quickfix]r :crewind<CR>
nmap [quickfix]l :clast<CR>
