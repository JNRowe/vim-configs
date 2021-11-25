``localcfg/plugin_vim_eighties.vim``
====================================

:repo:`committia <rhysd/committia.vim>` should be treated as static window
layout::

    let g:eighties_bufname_additional_patterns = [
    \   '__committia_diff__',
    \   '__committia_status__',
    \ ]

A little wiggle room *feels* nicer::

    let g:eighties_extra_width = 3
