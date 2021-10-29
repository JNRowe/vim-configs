``vimrc.d/disabled.vim``
========================

Don’t load unhelpful [to me] default plugins.  This can basically be summed up
as the things which we don’t want(``vimball`` support), and things with far
superior external alternatives(Pygments_ over ``2html``) or plugins with
superior alternatives(:repo:`dein <Shougo/dein.vim>` over ``getscript``).

::

    function! s:disable_plugin(str) abort
        execute 'let g:loaded_' . a:str . ' = v:true'
    endfunction

    for s:plugin in [
        \   '2html_plugin', 'getscriptPlugin', 'logipat', 'netrw',
        \   'netrwPlugin', 'rrhelper', 'spellfile_plugin', 'tarPlugin',
        \   'vimballPlugin', 'zipPlugin',
        \ ]
        call s:disable_plugin(s:plugin)
    endfor

.. note::

    For archive specific plugins archivemount_ is *much* better alternative to
    the :command:`vim` plugins; it supports more formats, is a great deal faster
    and allows seamless processing with external tools while editing.

Forcibly disable ``matchit``, as we’re using the :ref:`vim-matchup
<vim-matchup-plugin>` plugin::

    call s:disable_plugin('matchit')

.. _pygments: http://pygments.org/
.. _archivemount: http://www.cybernoia.de/software/archivemount/
