``localcfg/plugin_fzf.vim``
===========================

Use smaller than default :repo:`fzf <junegunn/fzf>` window::

    let g:fzf_layout = { 'down': '~30%' }

Hide status line::

    if has('autocmd')
        function! s:fzf_status()
            let l:laststatus = &laststatus
            let l:ruler = &ruler
            let l:showmode = &showmode
            autocmd FileType fzf set laststatus=0 noshowmode noruler
            execute 'autocmd BufLeave <buffer> set ' .
                \ 'laststatus=' . l:laststatus ' ' .
                \ (l:ruler ? '' : 'no') . 'ruler ' .
                \ (l:showmode ? '' : 'no') . 'showmode'
        endfunction

        augroup jnrowe_fzf
            autocmd FileType fzf call <SID>fzf_status()
        augroup END
    endif

Override default prompt colour::

    let g:fzf_colors = {
        \ 'prompt':  ['fg', 'Conditional'],
    \ }

Keep history in `XDG basedir`_ compliant location::

    let g:fzf_history_dir = g:vim_cache_dir . '/fzf-history'

Jump through hoops to find a valid way to run :command:`fzf` if ``:terminal``
isn’t available::

    if !has('terminal')
        if $TERMINAL == 'st' || $TERMINAL == 'urxvtc'
            let g:fzf_launcher = $TERMINAL . ' -e ' . $SHELL . ' -c %s'
        elseif $TERMINAL == 'xterm'
            let g:fzf_launcher = 'xterm -e ' . $SHELL . ' -ic %s'
        elseif executable('st')
            let g:fzf_launcher = 'st -e ' . $SHELL . ' -c %s'
        elseif executable('urxvtc')
            let g:fzf_launcher = 'urxvtc -e ' . $SHELL . ' -c %s'
        else
            let g:fzf_launcher = 'xterm -e ' . $SHELL . ' -ic %s'
        endif
    endif

.. _XDG basedir: http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
