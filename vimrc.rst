Basic setup
===========

.. include:: .includes/scriptencoding.rst

Recent vim versions disable compatible when a ``vimrc`` is found, but some
distributions are disabling that change for a reason that is far beyond me.

.. code-block:: vim

    if &compatible
        set nocompatible
    endif

Warn users with pre-v8 vim that problems with occur, but note that pull
requests which aren’t too invasive are welcome.

.. code-block:: vim

    if v:version < 800
        let v:warningmsg = 'Vim version 8 or higher is required'
        echohl WarningMsg
        echomsg v:warningmsg
        echohl none
    endif

neovim is *never* tested, as it removes functionality I use.  Feel free to open
pull requests for neovim support, *iff* they aren’t too invasive and don’t
break vim.

.. code-block:: vim

    if has('nvim')
        let v:errmsg = 'This config will *NOT* work with nvim'
        echohl ErrorMsg
        echoerr v:errmsg
        echohl none
        cquit
    endif

Pull in semi-private local settings.  This is only for locally required
settings while reading this file.

.. code-block:: vim

    if filereadable(fnamemodify('~/.vim/vimrc.pre', ':p'))
        source ~/.vim/vimrc.pre
    endif

Pull in remaining configs.

.. code-block:: vim

    runtime vimrc.d/paths.vim  " *Must* be early

    runtime vimrc.d/disabled.vim
    runtime vimrc.d/dein.vim
    runtime vimrc.d/settings.vim
    runtime vimrc.d/syntax.vim
    runtime vimrc.d/maps.vim
    runtime vimrc.d/misc.vim
    if has('patch-7.4.1821')
        runtime vimrc.d/packages.vim
    else
        " There may be other things in packages.vim, but this is *the* thing
        " I can't do without.
        if !exists('*EditExisting')
            runtime macros/editexisting.vim
        endif
    endif
    runtime vimrc.d/localcfg.vim
