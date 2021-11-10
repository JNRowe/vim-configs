``localcfg/plugin_vim_eighties.vim``
====================================

Both :repo:`gundo <sjl/gundo.vim>` and :repo:`committia <rhysd/committia.vim>`
should be treated as static window layouts::

    let g:eighties_bufname_additional_patterns = [
        \ '__Gundo__',
        \ '__Gundo_Preview__',
        \ '__committia_diff__',
        \ '__committia_status__',
    \ ]

A little wiggle room *feels* nicer::

    let g:eighties_extra_width = 3
