``localcfg`` - Optional and system dependent configuration files
================================================================

The directory contains feature and plugin specific configuration data.

FAQ
---

Why do some filenames end with ``.vim.vim``
'''''''''''''''''''''''''''''''''''''''''''

Filenames are made to closely match the plugin name, so that a simple ``git``
commit hook can check that the external exists and that the config is named
correctly.

But yeah, I agree it is kind of ugly.

Why all the dynamic expansion for ``loaded_*`` vars?
''''''''''''''''''''''''''''''''''''''''''''''''''''

I'm glad you asked.  It takes practically no extra time at read, and means
I can just template up new config files.

The old ones are also that way to make it less effort to dive in to a random
file.

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
    plugin_ack.vim
    plugin_ale
    plugin_calendar_vim
    plugin_committia.vim
    plugin_delimitMate
    plugin_dwm.vim
    plugin_editorconfig_vim
    plugin_emmet_vim
    plugin_fzf
    plugin_fzf.vim
    plugin_goyo.vim
    plugin_gundo.vim
    plugin_html5.vim
    plugin_jedi_vim
    plugin_molokai
    plugin_rainbow
    plugin_regex
    plugin_securemodelines
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
    plugin_vim_indent_guides
    plugin_vim_jinja
    plugin_vim_jnrowe
    plugin_vim_ledger
    plugin_vim_maximizer
    plugin_vim_notes
    plugin_vim_obsession
    plugin_vim_omnipytent
    plugin_vim_orgmode
    plugin_vim_parenmatch
    plugin_vim_projectionist
    plugin_vim_quick_radon
    plugin_vim_rhubarb
    plugin_vim_signature
    plugin_vim_sneak
    plugin_vim_snippets
    plugin_vim_space
    plugin_vim_speeddating
    plugin_vim_startify
    plugin_vim_table_mode
    plugin_vim_textobj_quote
    plugin_vim_vebugger
    plugin_vimwiki
    plugin_wordnet.vim
    quickfix
