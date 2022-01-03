``localcfg/plugins/nerdtree.vim``
=================================

.. include:: ../../.includes/scriptversion.rst

Case sensitive sort like *every other tool* I use::

    let g:NERDTreeCaseSensitiveSort = v:true
    let g:NERDTreeBookmarksSort = v:true

Natural sort like *nearly* every other tool I use::

    let g:NERDTreeNaturalSort = v:true

Store bookmarks files in |XDG basedir| compliant location::

    let g:NERDTreeBookmarksFile = g:vim_data_dir . '/NERDTreeBookmarks'
