``vimrc.d/dein.vim``
====================

Make the :repo:`dein <Shougo/dein.vim>` submodule available to :command:`vim`::

    set runtimepath+=~/.vim/external/dein.vim/

.. note::

    I *hate* submodules, but this is the cleanest way to support standing up
    a new machine that I can think of.  If you know a better way *please* `tell
    me`_.

Keep plugins and data in `XDG basedir`_ compliant location::

    let g:dein_state_dir = g:vim_cache_dir . '/dein'
    let g:dein_repos_dir = g:dein_state_dir . '/repos'

If possible, support `system notifications`_:

::

    if executable('notify-send') && exists('$DISPLAY')
        let g:dein#enable_notification = v:true
        let g:dein#notification_icon = '~/.vim/icons/editor.svg'
    endif

Handle initial plugin configuration::

    if dein#load_state(g:dein_state_dir)
        call dein#begin(g:dein_state_dir, ['~/.vim/vimrc', '~/.vim/dein.vim', expand('<sfile>')])

        source ~/.vim/dein.vim

        call dein#end()
        call dein#save_state()
    endif

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

Enable all the vim fanciness::

    filetype plugin indent on
    syntax enable

.. _tell me: jnrowe@gmail.com
.. _XDG basedir: http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
.. _system notifications: https://git.gnome.org/browse/libnotify
