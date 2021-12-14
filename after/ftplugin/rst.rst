``after/ftplugin/rst.vim``
==========================

.. _rst-custom-maps:

This creates |reST| headings using *my* favourite adornments::

    call keymaps#mnemonic_map('Heading', {'buffer': v:true, 'local': v:true})

    for s:level in [1, 2, 3]
        for s:pad in [v:true, v:false]
            execute 'nnoremap <silent> <buffer> [Heading]' .
            \   (s:pad != v:true ? 's' : '') . s:level . ' ' .
            \   ':call filetypes#make_reST_header(' . s:level . ', ' .
            \   s:pad . ')<CR>'
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

    setlocal suffixesadd+=.rst
    let b:undo_ftplugin .= '|setlocal suffixesadd<'

.. _Sphinx: http://sphinx-doc.org/
