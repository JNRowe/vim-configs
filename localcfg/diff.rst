``localcfg/diff.vim``
=====================

Ignore whitespace by default::

    set diffopt+=iwhite

The remaining functionality is only useful when ``autocmd`` is available.

::

    if !has('autocmd')
        finish
    endif

Add my bindings for diff mode::

    function! s:diff_maps()
        call MnemonicMap('diff', {'key': 'i', 'local': v:true})

        noremap <buffer> [diff]w :call ToggleFlag('diffopt', 'iwhite')<CR>

        noremap <buffer> [diff]o :diffoff!<CR>
        noremap <buffer> [diff]p :diffput<CR>
        noremap <buffer> [diff]g :diffget<CR>
        noremap <buffer> [diff]u :diffupdate<CR>

        vnoremap <buffer> < :diffget<CR>
        vnoremap <buffer> > :diffput<CR>
    endfunction

    augroup jnrowe_diff
        autocmd!
        autocmd BufEnter * if &diff | call s:diff_maps() | endif
    augroup END
