``localcfg/plugin_ale.vim``
===========================

.. include:: ../.includes/scriptencoding.rst

.. code-block:: vim

    let g:ale_completion_max_suggestions = 20
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = v:true
    let g:ale_open_list = v:true

Requires Font Awesome in places

.. code-block:: vim

    if (&termencoding ==# 'utf-8') || has('gui_running')
        let g:ale_sign_error = ''
        let g:ale_sign_warning = ''
        let g:ale_sign_info = ''  " ''
        let g:ale_sign_style_error = ''
        let g:ale_sign_style_warning = ''
    endif

.. note::

    I have FA resolve locally as webfonts are disabled in my browsers, if you
    don't have a similar setup then the following won't work.

.. code-block:: vim

    nnoremap [ale] <Nop>
    nmap <LocalLeader>a [ale]

    for [s:key, s:cmd] in [
        \   ['d',      'detail'],
        \   ['f',      'fix'],
        \   ['l',      'lint'],
        \   ['t',      'toggle'],
        \   ['<Home>', 'first'],
        \   ['<End>',  'last'],
        \   ['<Down>', 'previous_wrap'],
        \   ['<Up>',   'next_wrap'],
        \ ]
        execute 'nmap <silent> [ale]' . s:key . ' ' . '<Plug>(ale_' . s:cmd . ')'
    endfor
