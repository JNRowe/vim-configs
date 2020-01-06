``vimrc.d/disabled.vim``
========================

Don’t load unhelpful [to me] default plugins.  This can basically be summed up
as the things which we don’t want(``vimball`` support), and things with far
superior external alternatives(Pygments_ over ``2html``) or plugins with
superior alternatives(:repo:`dein <Shougo/dein.vim>` over ``getscript``).

::

    for s:plugin in [
        \   '2html_plugin', 'getscriptPlugin', 'logipat', 'netrw',
        \   'netrwPlugin', 'rrhelper', 'spellfile_plugin', 'tarPlugin',
        \   'vimballPlugin', 'zipPlugin',
        \ ]
        execute 'let g:loaded_' . s:plugin . ' = v:true'
    endfor

.. _pygments: http://pygments.org/
