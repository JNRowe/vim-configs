``localcfg/plugins/nerdtree.vim``
=================================

.. include:: ../../.includes/scriptversion.rst

Case sensitive sort like *every other tool* I use::

    const g:NERDTreeCaseSensitiveSort = v:true
    const g:NERDTreeBookmarksSort = v:true

Natural sort like *nearly* every other tool I use::

    const g:NERDTreeNaturalSort = v:true

Store bookmarks files in |XDG basedir| compliant location::

    const g:NERDTreeBookmarksFile = g:vim_data_dir .. '/NERDTreeBookmarks'
