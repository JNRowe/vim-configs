``vimrc.d/disabled.vim``
========================

Don’t load unhelpful [to me] default plugins.  This can basically be summed up
as the things which we don’t want(``vimball`` support), and things with far
superior external alternatives(Pygments_ over ``2html``) or plugins with
superior alternatives(dein_ over ``getscript``).

.. code-block:: vim

    let g:loaded_2html_plugin = v:true
    let g:loaded_getscriptPlugin = v:true
    let g:loaded_logipat = v:true
    let g:loaded_netrw = v:true
    let g:loaded_netrwPlugin = v:true
    let g:loaded_rrhelper = v:true
    let g:loaded_spellfile_plugin = v:true
    let g:loaded_tarPlugin = v:true
    let g:loaded_vimballPlugin = v:true
    let g:loaded_zipPlugin = v:true

.. _pygments: http://pygments.org/
.. _dein: https://github.com/Shougo/dein.vim
