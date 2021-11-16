``localcfg/spell.vim``
======================

.. include:: ../.includes/scriptencoding.rst

Automatically rebuild ``'spellfile'`` files on write::

    augroup jnrowe_spell
        autocmd BufWritePost ~/.vim/spell/*.add silent mkspell! %
    augroup END
