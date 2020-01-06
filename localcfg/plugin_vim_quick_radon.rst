``localcfg/plugin_vim_quick_radon.vim``
=======================================

.. _vim-quick-radon-custom-maps:

Configure my custom maps::

    call MnemonicMap('radon', {'key': 'p', 'local': v:true})

.. note::

    :kbd:`<Leader>r` is free globally, but ``jedi-vim`` uses it in my Python
    files.

Display radon_ output if possible::

    function! s:radon_open() abort
        if &filetype ==# 'python'
            QuickRadon
        endif
    endfunction
    nnoremap <silent> [radon]o :call <SID>radon_open()<CR>

Add map to close radon_ window from anywhere::

    function! s:radon_close_win() abort
        if bufnr('quick_radon') > -1
            exec bufnr('quick_radon') . 'bdelete!'
        endif
    endfunction

    nnoremap <silent> [radon]c :call <SID>radon_close_win()<CR>

.. _radon: https://radon.readthedocs.io/
