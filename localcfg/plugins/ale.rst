``localcfg/plugins/ale.vim``
============================

.. include:: ../../.includes/scriptencoding.rst

.. include:: ../../.includes/scriptversion.rst

Use a low priority for spawned commands::

    let g:ale_command_wrapper = 'nice -n5'

All too often setting suggestions much higher than twenty grinds things to
a halt::

    const g:ale_completion_max_suggestions = 20

Disable lint on change as it is *far* too processor intensive for me::

    let g:ale_lint_on_text_changed = 'never'

Attempt to show messages near cursor position::

    let g:ale_virtualtext_cursor = 1

Disable lint on ``BufWinEnter`` so that using ``{arg,buf,win}do`` doesn’t
suddenly fire up tonnes of processes::

    let g:ale_lint_on_enter = 0

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

Configure prettier signs::

    let g:ale_sign_error = ''
    let g:ale_sign_warning = ''
    let g:ale_sign_info = ''
    let g:ale_sign_style_error = ''
    let g:ale_sign_style_warning = ''

    if has('gui_running')
        for s:k in ['Error', 'Info', 'Warning']
            execute printf('sign define ALE%sSign icon=%s%s.png', s:k,
            \              expand('~/.vim/icons/'), tolower(s:k))
        endfor
    endif

.. include:: ../../.includes/fontawesome.rst

Disable ``ale`` in :wikipedia:`MHTML` files as they are seldom more than an
archival format::

    const g:ale_pattern_options = {
    \   '\.mht\(ml\)\?$': #{ale_enabled: v:false}
    \ }

Language specific settings
--------------------------

Configure :pypi:`black` to match projects I work on::

    const g:ale_python_black_options =
    \   '--line-length 79 --target-version py39 --skip-string-normalization'

.. note::

    Much like choosing my |vim| version based on what is packaged in Debian, my
    base Python version is chosen based on Debian stable’s Python version.
