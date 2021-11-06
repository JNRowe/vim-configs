``after/ftplugin/gitrebase.vim``
================================

.. _gitrebase-custom-maps:

Use my custom maps::

    call keymaps#mnemonic_map('rebase', {'buffer': v:true, 'local': v:true})

    for s:verb in ['Cycle', 'Edit', 'Fixup', 'Pick', 'Reword', 'Squash']
        execute 'nnoremap <buffer> <silent> [rebase]' . tolower(s:verb[0]) .
            \ ' :' . s:verb .'<CR>'
    endfor

.. note::

    Only those :command:`git rebase` options which are used regularly are
    enabled, others can rely on ``:Cycle``.

Add quick bindings to cycle available options using ``switch.vim`` as it
supports directions::

    nnoremap <buffer> <silent> { :SwitchReverse<CR>
    nnoremap <buffer> <silent> } :Switch<CR>

.. note::

    This obviously shadows *immensely* useful bindings, but they aren’t very
    useful in this particular filetype because of the :command:`git rebase`
    template.
