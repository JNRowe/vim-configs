``localcfg/plugins/vim_snippets.vim``
=====================================

Configure personal settings for snippets::

    let g:snips_author = g:user_email
    let g:snips_github =
    \   'https://github.com/' . substitute(g:user_email, '.* <\(.*\)@.*', '\1',
    \                                      '')
