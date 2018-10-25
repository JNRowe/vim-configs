``localcfg/plugin_fzf.vim``
===========================

.. code-block:: vim

    let g:fzf_layout = { 'down': '~30%' }

.. code-block:: vim

    let g:fzf_colors = {
        \ 'prompt':  ['fg', 'Conditional'],
    \ }

.. code-block:: vim

    let g:fzf_history_dir = g:vim_cache_dir . '/fzf-history'

.. code-block:: vim

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
