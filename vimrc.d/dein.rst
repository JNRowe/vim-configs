``vimrc.d/dein.vim``
====================

.. include:: ../.includes/scriptversion.rst

Make the :repo:`dein.vim <Shougo/dein.vim>` :command:`git` submodule available
to |vim|::

    set runtimepath+=~/.vim/external/dein.vim/

.. note::

    I *hate* bundling, but this is the cleanest way to support standing up a new
    machine that I can think of.  If you know a better way *please* drop me
    a |mail|.

Keep plugins and data in |XDG basedir| compliant location::

    const g:dein_state_dir = g:vim_cache_dir .. '/dein'
    const g:dein_repos_dir = g:dein_state_dir .. '/repos'

Disable automatic re-caching::

    const g:dein#auto_recache = v:false

Handle initial plugin setup::

    if dein#min#load_state(g:dein_state_dir)
        call dein#begin(
        \   g:dein_state_dir,
        \   ['~/.vim/vimrc', '~/.vim/dein.vim', expand('<sfile>')]
        \ )

Source the main plugin configuration::

        source ~/.vim/dein.vim

Complete setup and save state::

        call dein#end()
        call dein#save_state()
    endif

Manually fire hooks::

    call dein#call_hook('source')
    call dein#call_hook('post_source')

Issue a warning message if we’re missing plugins::

    if has('vim_starting')
        if dein#check_install()
            let v:warningmsg = 'dein: Missing plugins'
            echohl WarningMsg
            echomsg v:warningmsg
            echohl none
        endif
    endif

Enable all the usual fanciness an editor should present::

    filetype plugin indent on
    syntax enable
