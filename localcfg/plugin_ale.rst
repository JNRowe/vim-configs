``localcfg/plugin_ale.vim``
===========================

.. include:: ../.includes/scriptencoding.rst

Use a low priority for spawned commands::

    let g:ale_command_wrapper = 'nice -n5'

All too often setting suggestions much higher than twenty grinds things to
a halt::

    let g:ale_completion_max_suggestions = 20

Disable lint on change as it is *far* too processor intensive for me::

    let g:ale_lint_on_text_changed = 'never'

… but linting when leaving insert suits the way I work::

    let g:ale_lint_on_insert_leave = 1

Open location list when errors exist::

    let g:ale_open_list = 1

.. note::

    ``ale`` doesn’t support using ``v:true`` as ``1``.

.. include:: ../.includes/fontawesome.rst

::

    if (&termencoding ==# 'utf-8') || has('gui_running')
        let g:ale_sign_error = ''
        let g:ale_sign_warning = ''
        let g:ale_sign_info = ''
        let g:ale_sign_style_error = ''
        let g:ale_sign_style_warning = ''
    endif

    if has('gui_running')
        for s:k in ['Error', 'Info', 'Warning']
            execute 'sign define ALE' . s:k . 'Sign icon=' .
                \ expand('~/.vim/icons/' . tolower(s:k) . '.png')
        endfor
    endif

Use my custom maps::

    call MnemonicMap('ale', {'local': v:true})

    for [s:key, s:cmd] in [
        \   ['d',      'detail'],
        \   ['f',      'fix'],
        \   ['l',      'lint'],
        \   ['t',      'toggle'],
        \   ['<Home>', 'first'],
        \   ['<End>',  'last'],
        \   ['<Down>', 'next_wrap'],
        \   ['<Up>',   'previous_wrap'],
        \ ]
        execute 'nmap <silent> [ale]' . s:key . ' <Plug>(ale_' . s:cmd . ')'
    endfor
