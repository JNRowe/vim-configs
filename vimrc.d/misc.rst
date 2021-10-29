``vimrc.d/misc.vim``
====================

Show highlight group of the :ref:`current location
<GetHighlightGroup-function>`::

    command! ShowHighlightGroups
        \ echo join(map(misc#GetHighlightGroup(),
        \               {k, v -> join(values(map(v,
        \                                        {k, v -> k . ':' . v})),
        \                             ', ')}),
        \           ' | ')

Flag toggling function::

    function! ToggleFlag(option, flag) abort
        let l:optstr = eval('&' . a:option)
        if stridx(l:optstr, ',') == -1
            " Simple char options like 'fo'
            let l:flip = '+-'[l:optstr =~# a:flag]
        else
            " Comma lists options like 'cot'
            let l:flip = '+-'[index(split(l:optstr, ','), a:flag) != -1]
        endif
        execute 'set ' . a:option . l:flip . '=' . a:flag
    endfunction

User email address, as used by various plugins::

    silent let g:user_email = systemlist('git -C ~ config user.name')[0] .
        \ ' <' . systemlist('git -C ~ config user.email')[0] . '>'

Convenience function to apply title case to a word::

    function! TitleWord(word) abort
        return toupper(a:word[0]) . a:word[1:]
    endfunction

Many distributions package :command:`vim` with cherry picked patches, and
sometimes it is nice to know the current base version state::

    function! Version() abort
        let l:n = 1
        while has('patch' . n)
            let l:n += 1
        endwhile
        return printf('%d.%d.%04d', v:version / 100, v:version % 100, n - 1)
    endfunction
    command! Version echo 'vim-' . Version()

Make it easy to :command:`diff` options between sessions, which can be nice for
debugging, by printing the entirety of options::

    function! s:insert_options() abort
        python3 << EOF
    for k in sorted(vim.options):
        vim.current.buffer.append(f'{k}={vim.options[k]!r}')
    EOF
    endfunction
    command! InsertOptions call <SID>insert_options()

Add on-hover word definitions, which can be useful for prose editing::

    if has('gui_running') && executable('wn')
        command WordNetBalloon
            \ setlocal balloonexpr=misc#CommandBalloon('wn\ %s\ -over')
    endif

.. note::

    This is only enabled for :command:`gvim` as I have the mouse configured in
    a way which would be problematic for use with ``balloonevalterm``.
