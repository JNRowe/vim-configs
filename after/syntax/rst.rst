``after/syntax/rst.vim``
========================

.. include:: ../../.includes/scriptencoding.rst

.. include:: ../../.includes/scriptversion.rst

Bail early if ``conceal`` isn’t supported::

    if !has('conceal')
        finish
    endif

Show pretty bullets for unordered lists::

    syntax match rstList "^[*-]\ze "hs=e conceal cchar=•
    syntax match rstList "^\s\+[*-]\ze "hs=e conceal cchar=◦

.. note::

    I only use ``*`` and ``-`` for list prefixes, so these won’t work for
    everyone.  However, including all the reST prefix options opens the door for
    a lot of incorrect highlights without *massively* increasing the complexity.

.. image:: /.static/rst_list_conceal.png
   :alt: Sample reST lists with conceallevel=2

Show pretty markers for ordered lists::

    for s:n in range(1, 10)
        execute printf('syntax match rstList "^%d\.\ze " conceal cchar=%s',
        \              s:n, nr2char(9351 + s:n))
    endfor
    for s:n in range(1, 12)
        execute printf('syntax match rstList "^\s\+%d\.\ze "hs=e-1 ' .
        \              'conceal cchar=%s',
        \              s:n, nr2char(8559 + s:n))
    endfor

.. spelling::

    reST
