``localcfg/plugins/fzf.vim``
============================

.. include:: ../../.includes/scriptversion.rst

Use smaller than default :repo:`fzf <junegunn/fzf>` window::

    const g:fzf_layout = #{down: '~30%'}

Override default prompt colour::

    const g:fzf_colors = #{prompt:  ['fg', 'Conditional']}

Keep history in |XDG basedir| compliant location::

    const g:fzf_history_dir = g:vim_cache_dir .. '/fzf-history'

Jump through hoops to find a valid way to run :command:`fzf` if ``:terminal``
isn’t available::

    if !has('terminal')
        if $TERMINAL ==# 'st' || $TERMINAL ==# 'urxvtc'
            const g:fzf_launcher = printf('%s -e %s -c %%s', $TERMINAL, $SHELL)
        elseif executable('st')
            const g:fzf_launcher = printf('st -e %s -c %%s', $SHELL)
        elseif executable('urxvtc')
            const g:fzf_launcher = printf('urxvtc -e %s -c %%s', $SHELL)
        else
            const g:fzf_launcher = printf('xterm -e %s -ic %%s', $SHELL)
        endif
    endif
