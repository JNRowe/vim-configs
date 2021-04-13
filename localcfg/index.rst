``localcfg`` - Optional and system dependent configuration files
================================================================

The directory contains feature and plugin specific configuration data.

FAQ
---

.. contents::
    :local:

Why do some output filenames end with ``.vim.vim``
''''''''''''''''''''''''''''''''''''''''''''''''''

Filenames are made to closely match the plugin name, so that a simple
:command:`git` commit hook can check that the plugin exists and that the file
is named correctly.

But yeah, I agree that it is kinda ugly.

The hook I use is *sadly* dependent on an internal tool, but a similar
effect could be achieved with zsh_ in :file:`.git/hooks/pre-commit`:

.. code-block:: zsh

    extras=()
    for f (localcfg/plugin_*.vim) {
        plug_name=${f:t:r:s/plugin_//:gs/_/?/}
        if [ -z "${XDG_CACHE_HOME:-~/.cache}/vim/dein/repos/*/*/${plug_name}(/N)" ] \
            && [[ -z "~/.vim/internal/${plug_name}(/N)" ]]
        then
            extras+=$i
        fi
    }
    if [[ ${#extras} -gt 0 ]]; then
        echo "Extra config files:"
        echo ${(F)extras}
        exit 255
    fi

.. warning::

    I haven’t tested this beyond a quick shell session, but it is a start should
    you wish to do something similar using just :file:`.git/hooks/pre-commit`.
    [Co-workers: Vasily’s ``hookworm`` contains my hook in its examples
    document.]

Contents
--------

.. toctree::
    :titlesonly:

    abbr
    autocmd
    diff
    gui_macvim
    gui_running
    menu
    notgui_running
    plugin_Colorizer
    plugin_Recover.vim
    plugin_Replay
    plugin_ale
    plugin_black
    plugin_calendar_vim
    plugin_committia.vim
    plugin_delimitMate
    plugin_dwm.vim
    plugin_editorconfig_vim
    plugin_emmet_vim
    plugin_fzf
    plugin_fzf.vim
    plugin_git_messenger.vim
    plugin_goyo.vim
    plugin_jedi_vim
    plugin_molokai
    plugin_patchreview_vim
    plugin_rainbow
    plugin_regex
    plugin_securemodelines
    plugin_semantic_highlight.vim
    plugin_sideways.vim
    plugin_splitjoin.vim
    plugin_switch.vim
    plugin_tearoff
    plugin_ultisnips
    plugin_undotree
    plugin_unicode.vim
    plugin_vim_unimpaired
    plugin_vim_airline
    plugin_vim_bbye
    plugin_vim_bufmru
    plugin_vim_clevertab
    plugin_vim_coiled_snake
    plugin_vim_ditto
    plugin_vim_editqf
    plugin_vim_eighties
    plugin_vim_exchange
    plugin_vim_fugitive
    plugin_vim_gitgutter
    plugin_vim_illuminate
    plugin_vim_indent_guides
    plugin_vim_jinja
    plugin_vim_jnrowe
    plugin_vim_ledger
    plugin_vim_mundo
    plugin_vim_notes
    plugin_vim_omnipytent
    plugin_vim_peekaboo
    plugin_vim_projectionist
    plugin_vim_quick_radon
    plugin_vim_rhubarb
    plugin_vim_signature
    plugin_vim_sneak
    plugin_vim_snippets
    plugin_vim_space
    plugin_vim_speeddating
    plugin_vim_startify
    plugin_vim_textobj_quote
    plugin_vim_vebugger
    plugin_vim_vimlint
    plugin_vim_visual_multi
    plugin_wordnet.vim
    quickfix
    spell

.. _zsh: https://www.zsh.org/
