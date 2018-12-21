``localcfg/plugin_vim_exchange.vim``
====================================

Re-indent lines following exchange::

    let g:exchange_indent = '=='

Add command to toggle indentation option for the current buffer::

    command! ExchangeIndentToggle
        \ let b:exchange_indent = get(b:, "exchange_indent", g:exchange_indent) == v:true ? '==' : v:true
