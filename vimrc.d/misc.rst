``vimrc.d/misc.vim``
====================

Find highlight group of the given location::

    function! GetHighlightGroup(...) abort
        let [l:lnum, l:col] = getpos(get(a:, 1, '.'))[1:2]

        let s:synname = {synid -> synIDattr(synid, 'name')}

        let l:groups = []
        for l:id in synstack(l:lnum, l:col)
            let l:groups += [{
                \ 'high': s:synname(l:id),
                \ 'tran': s:synname(synIDtrans(l:id)),
            \ }]
        endfor
        return l:groups
    endfunction

Show highlight group of the current location::

    command! ShowHighlightGroups
        \ echo join(map(GetHighlightGroup(),
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

.. _Mnemonic-Map:

Mnemonic mapping setup function::

    function! MnemonicMap(name, ...) abort
        let l:extra = get(a:, 1, {})
        let l:buffer = get(l:extra, 'buffer', v:false) ? '<buffer>' : ''
        let l:key = get(l:extra, 'key', tolower(a:name[0]))
        let l:leader = get(l:extra, 'local', v:false) ? 'Local' : ''
        let l:mode = get(l:extra, 'mode', 'n')
        execute l:mode . 'noremap ' . l:buffer . ' [' . a:name . '] <Nop>'
        execute l:mode . 'map ' . l:buffer . ' <' . l:leader . 'Leader>'
            \ . l:key . ' [' . a:name . ']'
        execute l:mode . 'noremap <silent> [' . a:name . ']?'
            \ ' :' . l:mode . 'map [' . a:name . ']<CR>'
    endfunction

.. tip::

    This adds a :kbd:`?` binding to display the map list for ``name``.

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

A helper for simple ``balloonexpr`` usage that simply calls an external
command::

    function! CommandBalloon(cmd) abort
        let l:cmd = stridx(a:cmd, '%s') == -1 ? a:cmd . ' %s' : a:cmd
        return systemlist(printf(l:cmd, v:beval_text))
    endfunction

Add on-hover word definitions, which can be useful for prose editing::

    if has('gui_running') && executable('wn')
        command WordNetBalloon
            \ setlocal balloonexpr=CommandBalloon('wn\ %s\ -over')
    endif

.. note::

    This is only enabled for :command:`gvim` as I have the mouse configured in
    a way which would be problematic for use with ``balloonevalterm``.
