``localcfg/plugin_fzf.vim``
===========================

Use smaller than default :repo:`fzf <junegunn/fzf>` window::

    let g:fzf_layout = { 'down': '~30%' }

Override default prompt colour::

    let g:fzf_colors = {'prompt':  ['fg', 'Conditional']}

Keep history in |XDG basedir| compliant location::

    let g:fzf_history_dir = g:vim_cache_dir . '/fzf-history'

Jump through hoops to find a valid way to run :command:`fzf` if ``:terminal``
isn’t available::

    if !has('terminal')
        if $TERMINAL ==# 'st' || $TERMINAL ==# 'urxvtc'
            let g:fzf_launcher = $TERMINAL . ' -e ' . $SHELL . ' -c %s'
        elseif executable('st')
            let g:fzf_launcher = 'st -e ' . $SHELL . ' -c %s'
        elseif executable('urxvtc')
            let g:fzf_launcher = 'urxvtc -e ' . $SHELL . ' -c %s'
        else
            let g:fzf_launcher = 'xterm -e ' . $SHELL . ' -ic %s'
        endif
    endif
