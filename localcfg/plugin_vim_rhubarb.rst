``localcfg/plugin_vim_rhubarb.vim``
===================================

Configure authentication data::

    silent let g:github_password = systemlist('pass github.com')[0]
    let g:github_user = 'JNRowe'

.. todo::

    Not sure of a reasonable way to make this generic
