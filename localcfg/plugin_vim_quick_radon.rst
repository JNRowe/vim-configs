``localcfg/plugin_vim_quick_radon.vim``
=======================================

.. _vim-quick-radon-custom-maps:

Configure my custom maps::

    call keymaps#mnemonic_map('radon', {'key': 'p', 'local': v:true})

.. note::

    :kbd:`<Leader>r` is free globally, but ``jedi-vim`` uses it in my Python
    files.

Display radon_ output if possible::

    nnoremap <silent> [radon]o :call plugins#vim_quick_radon#open_win()<CR>

Add map to close radon_ window from anywhere::

    nnoremap <silent> [radon]c :call plugins#radon#close_win()<CR>

.. _radon: https://radon.readthedocs.io/
