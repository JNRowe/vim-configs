``ftplugin/changelog.vim``
==========================

.. include:: ../.includes/scriptversion.rst

For old fashioned projects with hand crafted :file:`ChangeLog` files,
``:NewChangelogEntry`` is fantastic laziness.

::

    let g:changelog_username = g:user_email

.. tip::

    You can also fiddle with the ``g:changelog_new_date_format`` and
    ``g:changelog_new_entry_format`` to make it match various different formats
    in use.  For me, the only project that still keeps a hand crafted
    :file:`ChangeLog` exactly matches the default.
