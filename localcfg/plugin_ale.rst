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

.. todo::

    Should this choose whether to use quickfix or location list based on
    filetype/project?  Perhaps, projects in a repository should use quickfix
    and things outside should use location list?

.. caution::

    ``ale`` doesn’t support using ``v:true`` as ``1``.

Limit initial window size to five lines, which appears to be *my* magic
number::

    let g:ale_list_window_size = 5

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
            \   expand('~/.vim/icons/' . tolower(s:k) . '.png')
        endfor
    endif

.. _ale-custom-maps:

Use my custom maps::

    call keymaps#mnemonic_map('ale', {'local': v:true})

    for [s:key, s:cmd] in [
    \   ['br',     'reset_buffer'],
    \   ['bt',     'toggle_buffer'],
    \   ['d',      'detail'],
    \   ['f',      'fix'],
    \   ['gd',     'go_to_definition'],
    \   ['gt',     'go_to_type_definition'],
    \   ['l',      'lint'],
    \   ['r',      'reset'],
    \   ['t',      'toggle'],
    \   ['vgd',    'go_to_definition_in_vsplit'],
    \   ['vgt',    'go_to_type_definition_in_vsplit'],
    \   ['<Home>', 'first'],
    \   ['<End>',  'last'],
    \   ['<Down>', 'next_wrap'],
    \   ['<Up>',   'previous_wrap'],
    \ ]
        execute 'nmap <silent> [ale]' . s:key . ' <Plug>(ale_' . s:cmd . ')'
    endfor

.. note::

    You can simply use the normal location list bindings for movement too.
    However, ale’s next and previous movements are buffer position sensitive
    instead of being relative to the position in the location list.  Both
    movement methods are useful at different times.

.. seealso::

    * :func:`keymaps#mnemonic_map() <mnemonic_map>`

Disable ``ale`` in :wikipedia:`MHTML` files as they are seldom more than an
archival format::

    let g:ale_pattern_options = {
    \   '\.mht\(ml\)\?$': {'ale_enabled': v:false}
    \ }
