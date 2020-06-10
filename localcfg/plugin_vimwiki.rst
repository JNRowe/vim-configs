``localcfg/plugin_vimwiki.vim``
===============================

.. include:: ../.includes/scriptencoding.rst

Use my custom maps::

    call MnemonicMap('vimwiki', {'key': 'x'})
    let g:vimwiki_map_prefix = '[vimwiki]'

I keep a personal wiki, and also one that is available to co-workers.  We’ll
want them both configured to export one save and maintain their own table of
contents::

    let g:vimwiki_list = [
        \ {
        \   'path': '~/wiki/input',
        \   'path_html': '~/wiki/html/',
        \   'auto_export': v:true,
        \   'auto_toc': v:true
        \ },
        \ {
        \   'path': '~/wiki/shared/input',
        \   'path_html': '~/wiki/shared/html/',
        \   'auto_export': v:true,
        \   'auto_toc': v:true
        \ }
    \ ]

Drop menu items in to the generic plugin header::

    let g:vimwiki_menu = 'Plugin.Vimwiki'

Configure symbols::

    let g:vimwiki_listsyms = '▁▄▆█'
    let g:vimwiki_listsym_rejected = '𝍐'

Use the far more useful, but more slower, expression based folding::

    let g:vimwiki_folding = 'list'
