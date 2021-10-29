``localcfg/diff.vim``
=====================

Ignore whitespace by default::

    set diffopt+=iwhite

Use histogram :command:`diff` method to match my git_ config::

    if has('patch-8.1.0360')
        set diffopt+=algorithm:histogram,indent-heuristic
    endif

The remaining functionality is only useful when ``autocmd`` is available.

::

    if !has('autocmd')
        finish
    endif

.. _diff-custom-maps:

Add my bindings for :command:`diff` mode::

    function! s:diff_maps() abort
        call misc#MnemonicMap('diff', {'key': 'i', 'local': v:true})

        for [s:key, s:cmd] in [
            \   ['w', 'call misc#ToggleFlag("diffopt", "iwhite")'],
            \   ['o', 'diffoff!'],
            \   ['p', 'diffput'],
            \   ['g', 'diffget'],
            \   ['u', 'diffupdate'],
            \ ]
            execute 'nnoremap <silent> <buffer> [diff]' . s:key . ' :' . s:cmd . '<CR>'
        endfor

        vnoremap <buffer> < :diffget<CR>
        vnoremap <buffer> > :diffput<CR>
    endfunction

    augroup jnrowe_diff
        autocmd!
        autocmd BufEnter * if &diff | call <SID>diff_maps() | endif
    augroup END

.. _git: https://git-scm.com/
