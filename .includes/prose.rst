Set useful defaults for formatting prose::

    call filetypes#apply_ftplugin('formatoptions+=2')

.. seealso::

    * :func:`filetypes#apply_ftplugin() <apply_ftplugin>`

Add dictionary from miscfiles_ if available::

    if filereadable('/usr/share/dict/words')
        call filetypes#apply_ftplugin('complete+=k/usr/share/dict/words')
    endif

.. seealso::

    * :func:`filetypes#apply_ftplugin() <apply_ftplugin>`

.. tip::

    On Debian_ systems this file tends to be provided by packages from the
    wordlist_ project(see ``aptitude search '~Pwordlist'`` for options).  On
    other systems, and possibly on Debian too, it may be provided by GNU’s
    miscfiles_ package.

Break undo sequence on sentence level punctuation.  This kind of feels better
when editing prose and also when making liberal use of ``undo-tree``.  Not yet
sure if it is too granular.

::

    for s:key in split(',.!?:;', '\zs')
        execute 'inoremap <buffer> ' .. s:key .. ' ' .. s:key .. '<C-g>u'
    endfor

Support increment and decrement on single characters for easy list prefix
manipulation::

    call filetypes#apply_ftplugin('nrformats+=alpha')

.. _miscfiles: https://savannah.gnu.org/projects/miscfiles/
.. _Debian: https://debian.org/
.. _wordlist: http://wordlist.sourceforge.net/
