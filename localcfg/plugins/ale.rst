``localcfg/plugins/ale.vim``
============================

.. include:: ../../.includes/scriptencoding.rst

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

.. todo::

    Should this choose whether to use quickfix or location list based on
    filetype/project?  Perhaps, projects in a repository should use quickfix
    and things outside should use location list?

.. caution::

    ``ale`` doesn’t support using ``v:true`` as ``1``.

Limit initial window size to five lines, which appears to be *my* magic
number::

    let g:ale_list_window_size = 5

.. include:: ../../.includes/fontawesome.rst

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
            \   expand('~/.vim/icons/' . tolower(s:k) . '.png')
        endfor
    endif

Disable ``ale`` in :wikipedia:`MHTML` files as they are seldom more than an
archival format::

    let g:ale_pattern_options = {
    \   '\.mht\(ml\)\?$': {'ale_enabled': v:false}
    \ }
