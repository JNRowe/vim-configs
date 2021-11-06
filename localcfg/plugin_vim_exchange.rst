``localcfg/plugin_vim_exchange.vim``
====================================

Re-indent lines following exchange::

    let g:exchange_indent = '=='

Add command to toggle indentation option for the current buffer::

    command! ExchangeIndentToggle
        \ let b:exchange_indent =
        \   get(b:, "exchange_indent", g:exchange_indent) is v:true
        \   ? '=='
        \   : v:true

.. tip::

    For parameter and argument reordering :ref:`sideways.vim
    <sideways.vim-config>` is often a better solution, as operations such as
    :kbd:`cxiwWcxiw` and :kbd:`cxiw2bcxiw` will only work in very simple cases.
