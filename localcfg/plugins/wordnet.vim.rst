``localcfg/plugins/wordnet.vim.vim``
====================================

.. include:: ../../.includes/scriptversion.rst

We don’t care that the dictionary buffer has trailing whitespace::

    if has('autocmd')
        augroup jnrowe_wordnet
            autocmd!
            autocmd BufNewFile __WordNet__ HideBadWhitespace
        augroup END
    endif
