``vimrc`` - Basic setup
=======================

First use of ``:scriptencoding`` must be after an initial encoding is set::

    set encoding=utf-8

.. include:: .includes/scriptencoding.rst

Recent |vim| versions disable ``'compatible'`` when a :file:`vimrc` is found,
but some distributions are disabling that change for a reason that is far beyond
me.

::

    " vint: -ProhibitSetNoCompatible
    if &compatible
        set nocompatible
    endif
    " vint: +ProhibitSetNoCompatible

Warn users with pre-v8 |vim| that problems will occur, but note that pull
requests which aren’t too invasive are most welcome.

::

    if v:version < 800
        let v:warningmsg = 'Vim version 8 or higher is required'
        echohl WarningMsg
        echomsg v:warningmsg
        echohl none
    endif

|neovim| is *never* tested, as it removes functionality I use.  Feel free to
open pull requests for ``neovim`` support, *iff* they aren’t too invasive *and*
they don’t break |vim|.

::

    if has('nvim')
        let v:errmsg = 'This config will *NOT* work with nvim'
        echoerr v:errmsg
        cquit
    endif

Enable profiler if :envvar:`VIM_PROFILE` is set.  For example,
``VIM_PROFILE=$TMPDIR/vim.prof`` will profile all files under ``~/.vim`` and
``VIM_PROFILE=$TMPDIR/vim.prof:dein#*`` will profile all ``dein#``-prefixed
function calls.  In both cases, output will be written to :file:`vim.prof`
under :envvar:`TMPDIR`.

::

    if exists('$VIM_PROFILE')
        let [s:profile_file, s:profile_func] =
        \   (split($VIM_PROFILE, ':') + [v:none])[:1]
        execute 'profile start ' . s:profile_file
        if s:profile_func is v:none
            profile file ~/.vim/*
        else
            execute 'profile func ' . s:profile_func
        endif
    endif

Pull in semi-private local settings::

    if filereadable(expand('~/.vim/vimrc.pre'))
        source ~/.vim/vimrc.pre
    endif

.. caution::

    This should only be used for settings required while reading *this* file.

.. _sourcing-order:

Pull in general |vim| configuration files::

    source ~/.vim/vimrc.d/paths.vim  " *Must* be early

    source ~/.vim/vimrc.d/disabled.vim
    source ~/.vim/vimrc.d/settings.vim
    source ~/.vim/vimrc.d/misc.vim
    source ~/.vim/vimrc.d/maps.vim
    if has('patch-7.4.1821')
        source ~/.vim/vimrc.d/packages.vim
    else
        " There may be other things in packages.vim, but this is *the* thing
        " I can’t do without.
        if !exists('*EditExisting')
            runtime macros/editexisting.vim
        endif
    endif

Pull in build dependent configuration files::

    if has('localmap')
        source ~/.vim/localcfg/abbr.vim
    endif
    for s:feature in ['autocmd', 'diff', 'notgui_macvim', 'gui_running',
    \                 'menu', 'quickfix', 'spell']
        let s:feature_file = '~/.vim/localcfg/' . (!has(s:feature) ? 'not' : '') .
        \   s:feature . '.vim'
        if filereadable(expand(s:feature_file))
            execute 'source ' . s:feature_file
        endif
    endfor

.. _host_specific_file:

Pull in host specific configuration data::

    if filereadable(expand('~/.vim/localcfg/' . hostname() . '.vim'))
        execute 'source ~/.vim/localcfg/' . hostname() . '.vim'
    endif

Define and configure plugins::

    source ~/.vim/vimrc.d/dein.vim

Configure syntax specific configuration information::

    source ~/.vim/vimrc.d/syntax.vim
