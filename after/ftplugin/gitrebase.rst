``after/ftplugin/gitrebase.vim``
================================

.. _gitrebase-custom-maps:

Use my custom maps::

    call keymaps#mnemonic_map('rebase', {'buffer': v:true, 'local': v:true})

    for s:verb in ['Cycle', 'Edit', 'Fixup', 'Pick', 'Reword', 'Squash']
        execute 'nnoremap <silent> <buffer> [rebase]' . tolower(s:verb[0]) .
        \   ' :' . s:verb .'<CR>'
    endfor

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

Add quick bindings to cycle available options using ``switch.vim`` as it
supports directions::

    nnoremap <silent> <buffer> { :SwitchReverse<CR>
    nnoremap <silent> <buffer> } :Switch<CR>

.. note::

    This obviously shadows *immensely* useful bindings, but they aren’t very
    useful in this instance because of the :command:`git rebase` template.
