set diffopt+=iwhite

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

augroup jnrowe_diff
    autocmd BufEnter * if &diff | call DiffMaps() | endif
augroup END
