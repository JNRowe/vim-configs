``vimrc`` - Basic setup
=======================

First use of ``:scriptencoding`` must be after an initial encoding is set::

    set encoding=utf-8

.. include:: .includes/scriptencoding.rst

.. include:: .includes/scriptversion.rst

Recent |vim| versions disable ``'compatible'`` when a :file:`vimrc` is found,
but some distributions are disabling that change for a reason that is far beyond
me.

::

    " vint: -ProhibitSetNoCompatible
    if &compatible
        set nocompatible
    endif
    " vint: +ProhibitSetNoCompatible

Warn users with |vim| versions lower than v8.2 that problems will occur, but
note that pull requests which aren’t too invasive are most welcome.

::

    if v:version < 802
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
        const [s:profile_file, s:profile_func] =
        \   (split($VIM_PROFILE, ':') + [v:none])[:1]
        execute 'profile start ' .. s:profile_file
        if s:profile_func is v:none
            profile file ~/.vim/*
        else
            execute 'profile func ' .. s:profile_func
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
    source ~/.vim/vimrc.d/packages.vim

.. _build_dependent_file:

Pull in build dependent configuration files::

    if has('localmap')
        source ~/.vim/localcfg/abbr.vim
    endif
    for s:feature in ['autocmd', 'diff', 'notgui_macvim', 'gui_running',
    \                 'menu', 'quickfix', 'spell']
        let s:feature_file = printf('~/.vim/localcfg/%s%s.vim',
        \                           !has(s:feature) ? 'not' : '', s:feature)
        if filereadable(expand(s:feature_file))
            execute 'source ' .. s:feature_file
        endif
    endfor

.. _host_specific_file:

Pull in host specific configuration data::

    const s:host_file = expand('~/.vim/localcfg/' .. hostname() .. '.vim')
    if filereadable(s:host_file)
        execute 'source ' .. s:host_file
    endif

Define and configure plugins::

    source ~/.vim/vimrc.d/dein.vim

Configure syntax specific configuration information::

    source ~/.vim/vimrc.d/syntax.vim
