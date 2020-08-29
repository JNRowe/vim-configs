``localcfg/plugin_vim_notes.vim``
=================================

Disable options that clash with :ref:`buffer changes <switch-bufs>`::

    let g:notes_alt_indents = v:false

I only use :command:`vim`’s builtin indent maps::

    let g:notes_tab_indents = v:false

Use a personal notes directory that can be version-controlled separately::

    let g:notes_directories = [g:xdg_data_dir . '/vim-notes']
    call mkdir(g:notes_directories[0], 'p')

Store indexes in `XDG basedir`_ compliant location::

    let s:notes_cache_dir = g:vim_cache_dir . '/vim-notes'
    call mkdir(s:notes_cache_dir, 'p')
    let g:notes_indexfile = s:notes_cache_dir . '/index.pickle'
    let g:notes_tagsindex = s:notes_cache_dir . '/tags.txt'

Dive in to the ``dein`` cache to set up documentation::

    let g:notes_shadowdir = g:dein_repos_dir .
        \ '/github.com/xolox/vim-notes/misc/notes/shadow'

We don’t require backwards compatibility, so respect word boundaries::

    let g:notes_word_boundaries = v:true

I prefer the exact behaviour of :ref:`vim-textobj-quote
<vim-textobj-quote-plugin>`::

    let g:notes_smart_quotes = v:false

.. _XDG basedir: http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
