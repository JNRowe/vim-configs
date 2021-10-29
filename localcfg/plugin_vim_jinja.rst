``localcfg/plugin_vim_jinja.vim``
=================================

Disable automatic detection as it occasionally produces false positives::

    let g:htmljinja_disable_detection = v:true
    let g:htmljinja_disable_html_upgrade = v:true

Add binding to enable jinja_ support in the current file::

    nmap <buffer> <LocalLeader>j
        \ :call SyntaxRange#Include('{{', '}}', 'jinja')<CR>
        \ :call SyntaxRange#Include('{%', '%}', 'jinja')<CR>

.. tip::

    This is a quick way to enable template editing support in a file while
    maintaining the current filetype’s syntax highlighting using the
    :ref:`SyntaxRange <SyntaxRange-plugin>` plugin.

.. _jinja: http://jinja.pocoo.org/
