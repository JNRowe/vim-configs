``localcfg``
============

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

* `abbr.vim <abbr.html>`__
* `autocmd.vim <autocmd.html>`__
* `diff.vim <diff.html>`__
* `gui_macvim.vim <gui_macvim.html>`__
* `gui_running.vim <gui_running.html>`__
* `menu.vim <menu.html>`__
* `notgui_running.vim <notgui_running.html>`__
* `plugin_Colorizer.vim <plugin_Colorizer.html>`__
* `plugin_Recover.vim.vim <plugin_Recover.vim.html>`__
* `plugin_Replay.vim <plugin_Replay.html>`__
* `plugin_Toggle.vim <plugin_Toggle.html>`__
* `plugin_ack.vim.vim <plugin_ack.vim.html>`__
* `plugin_ale.vim <plugin_ale.html>`__
* `plugin_calendar_vim.vim <plugin_calendar_vim.html>`__
* `plugin_committia.vim.vim <plugin_committia.vim.html>`__
* `plugin_delimitMate.vim <plugin_delimitMate.html>`__
* `plugin_dwm.vim.vim <plugin_dwm.vim.html>`__
* `plugin_editorconfig_vim.vim <plugin_editorconfig_vim.html>`__
* `plugin_emmet_vim.vim <plugin_emmet_vim.html>`__
* `plugin_fzf.vim <plugin_fzf.html>`__
* `plugin_fzf.vim.vim <plugin_fzf.vim.html>`__
* `plugin_goyo.vim.vim <plugin_goyo.vim.html>`__
* `plugin_gundo.vim.vim <plugin_gundo.vim.html>`__
* `plugin_html5.vim.vim <plugin_html5.vim.html>`__
* `plugin_jedi_vim.vim <plugin_jedi_vim.html>`__
* `plugin_mesonic.vim <plugin_mesonic.html>`__
* `plugin_molokai.vim <plugin_molokai.html>`__
* `plugin_rainbow.vim <plugin_rainbow.html>`__
* `plugin_regex.vim <plugin_regex.html>`__
* `plugin_securemodelines.vim <plugin_securemodelines.html>`__
* `plugin_sideways.vim.vim <plugin_sideways.vim.html>`__
* `plugin_splitjoin.vim.vim <plugin_splitjoin.vim.html>`__
* `plugin_tearoff.vim <plugin_tearoff.html>`__
* `plugin_ultisnips.vim <plugin_ultisnips.html>`__
* `plugin_undotree.vim <plugin_undotree.html>`__
* `plugin_unicode.vim.vim <plugin_unicode.vim.html>`__
* `plugin_vim-unimpaired.vim <plugin_vim-unimpaired.html>`__
* `plugin_vim_airline.vim <plugin_vim_airline.html>`__
* `plugin_vim_bbye.vim <plugin_vim_bbye.html>`__
* `plugin_vim_bufmru.vim <plugin_vim_bufmru.html>`__
* `plugin_vim_clevertab.vim <plugin_vim_clevertab.html>`__
* `plugin_vim_coiled_snake.vim <plugin_vim_coiled_snake.html>`__
* `plugin_vim_editqf.vim <plugin_vim_editqf.html>`__
* `plugin_vim_eighties.vim <plugin_vim_eighties.html>`__
* `plugin_vim_exchange.vim <plugin_vim_exchange.html>`__
* `plugin_vim_gitgutter.vim <plugin_vim_gitgutter.html>`__
* `plugin_vim_indent_guides.vim <plugin_vim_indent_guides.html>`__
* `plugin_vim_jinja.vim <plugin_vim_jinja.html>`__
* `plugin_vim_jnrowe.vim <plugin_vim_jnrowe.html>`__
* `plugin_vim_ledger.vim <plugin_vim_ledger.html>`__
* `plugin_vim_maximizer.vim <plugin_vim_maximizer.html>`__
* `plugin_vim_notes.vim <plugin_vim_notes.html>`__
* `plugin_vim_obsession.vim <plugin_vim_obsession.html>`__
* `plugin_vim_omnipytent.vim <plugin_vim_omnipytent.html>`__
* `plugin_vim_orgmode.vim <plugin_vim_orgmode.html>`__
* `plugin_vim_parenmatch.vim <plugin_vim_parenmatch.html>`__
* `plugin_vim_projectionist.vim <plugin_vim_projectionist.html>`__
* `plugin_vim_rhubarb.vim <plugin_vim_rhubarb.html>`__
* `plugin_vim_signature.vim <plugin_vim_signature.html>`__
* `plugin_vim_sneak.vim <plugin_vim_sneak.html>`__
* `plugin_vim_snippets.vim <plugin_vim_snippets.html>`__
* `plugin_vim_space.vim <plugin_vim_space.html>`__
* `plugin_vim_speeddating.vim <plugin_vim_speeddating.html>`__
* `plugin_vim_startify.vim <plugin_vim_startify.html>`__
* `plugin_vim_table_mode.vim <plugin_vim_table_mode.html>`__
* `plugin_vim_textobj_quote.vim <plugin_vim_textobj_quote.html>`__
* `plugin_vim_vebugger.vim <plugin_vim_vebugger.html>`__
* `plugin_vimwiki.vim <plugin_vimwiki.html>`__
* `plugin_wordnet.vim.vim <plugin_wordnet.vim.html>`__
* `quickfix.vim <quickfix.html>`__
