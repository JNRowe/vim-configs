``localcfg/plugins/vim_eighties.vim``
=====================================

.. include:: ../../.includes/scriptversion.rst

:repo:`committia <rhysd/committia.vim>` should be treated as static window
layout::

    const g:eighties_bufname_additional_patterns = [
    \   '__committia_diff__',
    \   '__committia_status__',
    \ ]

A little wiggle room *feels* nicer::

    const g:eighties_extra_width = 3
