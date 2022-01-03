``after/ftplugin/rst.vim``
==========================

.. _rst-custom-maps:

This creates |reST| headings using *my* favourite adornments::

    call keymaps#mnemonic_map('Heading', #{buffer: v:true, local: v:true})

    for s:level in [1, 2, 3]
        for s:pad in [v:true, v:false]
            execute printf('nnoremap <silent> <buffer> [Heading]%s%d ' .
            \              ':call filetypes#make_reST_header(%d, %s)<CR>',
            \              s:pad != v:true ? 's' : '', s:level, s:level, s:pad)
        endfor
    endfor

.. seealso::

    * :func:`filetypes#make_reST_header() <make_reST_header>`
    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

.. include:: ../../.includes/prose.rst

.. include:: ../../.includes/thesaurus.rst

The *vast* majority of the time I spend editing |reST| documents I am actually
editing files from a Sphinx_ project.  It is nice being able to :kbd:`gf` when
in a ``:doc:`` role or ``toctree`` directive::

    call filetypes#apply_ftplugin('suffixesadd+=.rst')

.. seealso::

    * :func:`filetypes#apply_ftplugin() <apply_ftplugin>`

.. _Sphinx: http://sphinx-doc.org/
