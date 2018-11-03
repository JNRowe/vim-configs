``localcfg/plugin_vim_eighties.vim``
====================================

Both gundo_ and committia_ should be treated as static window layouts::

    let g:eighties_bufname_additional_patterns = [
        \ '__Gundo__',
        \ '__Gundo_Preview__',
        \ '__committia_diff__',
        \ '__committia_status__',
    \ ]

A little wiggle room “feels” nicer::

    let g:eighties_extra_width = 3

.. _gundo: https://github.com/sjl/gundo.vim
.. _committia: https://github.com/rhysd/committia.vim
