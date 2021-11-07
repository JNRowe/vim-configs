``localcfg/plugin_fzf.vim``
===========================

Use smaller than default :repo:`fzf <junegunn/fzf>` window::

    let g:fzf_layout = { 'down': '~30%' }

Override default prompt colour::

    let g:fzf_colors = {
        \ 'prompt':  ['fg', 'Conditional'],
    \ }

Keep history in |XDG basedir| compliant location::

    let g:fzf_history_dir = g:vim_cache_dir . '/fzf-history'

Jump through hoops to find a valid way to run :command:`fzf` if ``:terminal``
isn’t available::

    if !has('terminal')
        if $TERMINAL ==# 'st' || $TERMINAL ==# 'urxvtc'
            let g:fzf_launcher = $TERMINAL . ' -e ' . $SHELL . ' -c %s'
        elseif $TERMINAL ==# 'xterm'
            let g:fzf_launcher = 'xterm -e ' . $SHELL . ' -ic %s'
        elseif executable('st')
            let g:fzf_launcher = 'st -e ' . $SHELL . ' -c %s'
        elseif executable('urxvtc')
            let g:fzf_launcher = 'urxvtc -e ' . $SHELL . ' -c %s'
        else
            let g:fzf_launcher = 'xterm -e ' . $SHELL . ' -ic %s'
        endif
    endif

Based on an example from the documentation, add a binding to populate the
``quickfix`` list from results::

    function! s:build_quickfix_list(lines) abort
        call setqflist(map(copy(a:lines), {_, s -> 'filename': s }))
        " 7 lines seems to be the magic number for *me*
        copen 7
    endfunction

    let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit'
    \ }
