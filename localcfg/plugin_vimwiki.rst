``localcfg/plugin_vimwiki.vim``
===============================

.. include:: ../.includes/scriptencoding.rst

.. code-block:: vim

    nnoremap [vimwiki] <Nop>
    nmap <Leader>x [vimwiki]

    let g:vimwiki_map_prefix = '[vimwiki]'

.. code-block:: vim

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

.. code-block:: vim

    let g:vimwiki_menu = 'Plugin.Vimwiki'
    let g:vimwiki_listsyms = '▁▄▆█'
    let g:vimwiki_listsym_rejected = '𝍐'
    let g:vimwiki_folding = 'list'
