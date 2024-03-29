``localcfg/plugins/vim_notes.vim``
==================================

.. include:: ../../.includes/scriptversion.rst

Disable options that clash with :ref:`buffer changes <switch-bufs>`::

    const g:notes_alt_indents = v:false

I only use |vim|’s builtin indent maps::

    const g:notes_tab_indents = v:false

Use a personal notes directory that can be version-controlled separately::

    const g:notes_directories = [g:xdg_data_dir .. '/vim-notes']
    if !isdirectory(g:notes_directories[0])
        call mkdir(g:notes_directories[0], 'p')
    endif

Store indexes in |XDG basedir| compliant location::

    const s:notes_cache_dir = g:vim_cache_dir .. '/vim-notes'
    if !isdirectory(s:notes_cache_dir)
        call mkdir(s:notes_cache_dir, 'p')
    endif
    const g:notes_indexfile = s:notes_cache_dir .. '/index.pickle'
    const g:notes_tagsindex = s:notes_cache_dir .. '/tags.txt'

Dive in to the ``dein`` cache to set up documentation::

    const g:notes_shadowdir = g:dein_repos_dir ..
    \   '/github.com/xolox/vim-notes/misc/notes/shadow'

Add an extension to saved notes so that filtering from a shell is easier::

    const g:notes_suffix = '.txt'

We don’t require backwards compatibility, so respect word boundaries::

    const g:notes_word_boundaries = v:true

Find a markdown processor::

    for s:p in ['pulldown-cmark', 'cmark', 'markdown2']
        if executable(s:p)
            const g:notes_markdown_program = s:p
            break
        endif
    endfor

I prefer using :ref:`vim-textobj-quote <vim-textobj-quote-plugin>` as it works
across filetypes::

    const g:notes_smart_quotes = v:false
