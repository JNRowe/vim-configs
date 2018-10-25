``ftplugin/changelog.vim``
==========================

.. code-block:: vim

    let g:changelog_username = systemlist('git -C ~ config user.name')[0] .
        \ ' <' . systemlist('git -C ~ config user.email')[0] . '>'
