``localcfg/plugin_vim-unimpaired.vim``
======================================

A fair few of the applications I use in my work support line or cell exchange
via :kbd:`<M-{Up,Down}>`, configure |vim| to match::

    imap <M-Up> <C-o><Plug>unimpairedMoveUp
    imap <M-Down> <C-o><Plug>unimpairedMoveDown
    nmap <M-Up> <Plug>unimpairedMoveUp
    nmap <M-Down> <Plug>unimpairedMoveDown
