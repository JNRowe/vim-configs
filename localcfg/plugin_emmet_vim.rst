``localcfg/plugin_emmet_vim.vim``
=================================

Enable omnicompletion::

    let g:user_emmet_complete_tag = v:true

Don’t create global maps::

    let g:user_emmet_install_global = v:false

Override locale, and enable jinja_ as HTML::

    let g:iser_emmet_settings = {
        \ 'variables': {
        \   'locale': 'en-GB',
        \ },
        \ 'htmljinja': {
        \   'extends': 'html',
        \ },
    \ }

Enable automatically where it will be useful::

    if has('autocmd')
        augroup jnrowe_emmet
            autocmd FileType css,html,xml EmmetInstall
        augroup END
    endif

.. _jinja: http://jinja.pocoo.org/
