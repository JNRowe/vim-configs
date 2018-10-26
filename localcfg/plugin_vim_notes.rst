``localcfg/plugin_vim_notes.vim``
=================================

Disable options that clash with buffer changes

.. code-block:: vim

    let g:notes_alt_indents = v:false
    let g:notes_tab_indents = v:false

.. code-block:: vim

    let g:notes_shadowdir = g:dein_repos_dir . '/github.com/xolox/vim-notes/misc/notes/shadow'
    let g:notes_word_boundaries = v:true
