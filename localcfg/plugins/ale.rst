``localcfg/plugins/ale.vim``
============================

.. include:: ../../.includes/scriptencoding.rst

.. include:: ../../.includes/scriptversion.rst

Use a low priority for spawned commands::

    let g:ale_command_wrapper = 'nice -n5'

All too often setting suggestions much higher than twenty grinds things to
a halt::

    let g:ale_completion_max_suggestions = 20

Disable lint on change as it is *far* too processor intensive for me::

    let g:ale_lint_on_text_changed = 'never'

Attempt to show messages near cursor position::

    let g:ale_virtualtext_cursor = 1

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
            execute printf('sign define ALE%sSign icon=%s%s.png', s:k,
            \              expand('~/.vim/icons/'), tolower(s:k))
        endfor
    endif

Disable ``ale`` in :wikipedia:`MHTML` files as they are seldom more than an
archival format::

    let g:ale_pattern_options = {
    \   '\.mht\(ml\)\?$': #{ale_enabled: v:false}
    \ }

Language specific settings
--------------------------

Configure :pypi:`black` to match projects I work on::

    let g:ale_python_black_options =
    \   '--line-length 79 --target-version py37 --skip-string-normalization'
