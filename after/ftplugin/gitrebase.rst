``after/ftplugin/gitrebase.vim``
================================

.. include:: ../../.includes/scriptversion.rst

.. _gitrebase-custom-maps:

Use my custom maps::

    call keymaps#mnemonic_map('rebase', #{buffer: v:true, local: v:true})

    for s:verb in ['Cycle', 'Edit', 'Fixup', 'Pick', 'Reword', 'Squash']
        execute printf('nnoremap <buffer> [rebase]%s <Cmd>%s<CR>',
        \              tolower(s:verb[0]), s:verb)
    endfor

.. image:: /.static/git_rebase_cycle.gif
   :alt: Example result of calling :Switch

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

Add quick bindings to cycle available options using ``switch.vim`` as it
supports directions::

    nnoremap <buffer> { <Cmd>SwitchReverse<CR>
    nnoremap <buffer> } <Cmd>Switch<CR>

.. note::

    This obviously shadows *immensely* useful bindings, but they aren’t very
    useful in this instance because of the :command:`git rebase` template.
