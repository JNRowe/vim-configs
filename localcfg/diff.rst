``localcfg/diff.vim``
=====================

.. code-block:: vim

    set diffopt+=iwhite

.. code-block:: vim

    function! s:diff_maps()
        call MnemonicMap('diff', {'key': 'i', 'local': v:true})

        noremap <buffer> [diff]o :diffoff!<CR>
        noremap <buffer> [diff]p :diffput<CR>
        noremap <buffer> [diff]g :diffget<CR>
        noremap <buffer> [diff]u :diffupdate<CR>

        vnoremap <buffer> < :diffget<CR>
        vnoremap <buffer> > :diffput<CR>
    endfunction

.. code-block:: vim

    augroup jnrowe_diff
        autocmd!
        autocmd BufEnter * if &diff | call s:diff_maps() | endif
    augroup END