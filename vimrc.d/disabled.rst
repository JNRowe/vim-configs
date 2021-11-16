``vimrc.d/disabled.vim``
========================

Don’t load unhelpful [to me] default plugins.  Basically, this can be summed up
as the things which we don’t want(``vimball`` support), things with far
superior external alternatives(Pygments_ over ``2html``), or plugins with
superior alternatives(:repo:`dein <Shougo/dein.vim>` over ``getscript``).

::

    for s:plugin in [
    \   '2html_plugin', 'getscriptPlugin', 'logipat', 'netrw',
    \   'netrwPlugin', 'rrhelper', 'spellfile_plugin', 'tarPlugin',
    \   'vimballPlugin', 'zipPlugin',
    \ ]
        call misc#disable_plugin(s:plugin)
    endfor

.. note::

    Compared to the archive format plugins, using archivemount_ is a *much*
    better solution; it supports more formats, is a great deal faster and allows
    seamless processing with external tools while editing.

Forcibly disable ``matchit``, as we’re using the :ref:`vim-matchup
<vim-matchup-plugin>` plugin::

    call misc#disable_plugin('matchit')

.. _pygments: http://pygments.org/
.. _archivemount: http://www.cybernoia.de/software/archivemount/
