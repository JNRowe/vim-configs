``vimrc.d/misc.vim``
====================

Show highlight group of the current text, taken from vim wiki which is now
offline.

::

    command! ShowHighlightGroup
        \ echo 'hi<' . synIDattr(synID(line('.'), col('.'), v:true), 'name') .
        \   '> trans<' . synIDattr(synID(line('.'), col('.'), v:false), 'name') .
        \   '> lo<' . synIDattr(synIDtrans(synID(line('.'), col('.'), v:true)),
        \                       'name') .
        \   '>'

Flag toggling function::

    function! ToggleFlag(option, flag)
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

Mnemonic mapping setup function::

    function! MnemonicMap(name, ...)
        let l:extra = get(a:, 1, {})
        let l:buffer = get(l:extra, 'buffer', v:false) ? '<buffer>' : ''
        let l:key = get(l:extra, 'key', tolower(a:name[0]))
        let l:leader = get(l:extra, 'local', v:false) ? 'Local' : ''
        let l:mode = get(l:extra, 'mode', 'n')
        execute l:mode . 'noremap ' . l:buffer . ' [' . a:name . '] <Nop>'
        execute l:mode . 'map ' . l:buffer . ' <' . l:leader . 'Leader>'
            \ . l:key . ' [' . a:name ."]"
        execute l:mode . 'noremap <silent> [' . a:name . ']?'
            \ ' :' . l:mode . 'map [' . a:name . ']<CR>'
    endfunction

.. tip::

    This adds a :kbd:`?` binding to display the map list for ``name``.

Many distributions package :command:`vim` with cherry picked patches, and
sometimes it is nice to know the current base version state::

    function! Version()
        let l:n = 1
        while has('patch' . n)
            let l:n += 1
        endwhile
        return join([v:version / 100, v:version % 100, n - 1], '.')
    endfunction
    command! Version :echo 'vim-' . Version()
