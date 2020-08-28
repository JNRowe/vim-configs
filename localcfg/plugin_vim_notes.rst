``localcfg/plugin_vim_notes.vim``
=================================

Disable options that clash with :ref:`buffer changes <switch-bufs>`::

    let g:notes_alt_indents = v:false

I only use :command:`vim`’s builtin indent maps::

    let g:notes_tab_indents = v:false

Dive in to the ``dein`` cache to set up documentation::

    let g:notes_shadowdir = g:dein_repos_dir .
        \ '/github.com/xolox/vim-notes/misc/notes/shadow'

We don’t require backwards compatibility, so respect word boundaries::

    let g:notes_word_boundaries = v:true

I prefer the exact behaviour of :ref:`vim-textobj-quote
<vim-textobj-quote-plugin>`::

    let g:notes_smart_quotes = v:false
