if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

function! DiffMaps()
    nnoremap [diff] <Nop>
    nmap <Leader>d [diff]

    noremap <buffer> [diff]o :diffoff!<CR>
    noremap <buffer> [diff]p :diffput<CR>
    noremap <buffer> [diff]g :diffget<CR>
    noremap <buffer> [diff]u :diffupdate<CR>

    vnoremap <buffer> < :diffget<CR>
    vnoremap <buffer> > :diffput<CR>
endfunction

autocmd BufEnter * if &diff | call DiffMaps() | endif