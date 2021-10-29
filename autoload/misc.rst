``autoload/misc.vim``
=====================

.. _GetHighlightGroup-function:

Find highlight group of the given location::

    function! misc#GetHighlightGroup(...) abort
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

Flag toggling function::

    function! misc#ToggleFlag(option, flag) abort
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

.. _Mnemonic-Map:

Mnemonic mapping setup function::

    function! misc#MnemonicMap(name, ...) abort
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

Convenience function to apply title case to a word::

    function! misc#TitleWord(word) abort
        return toupper(a:word[0]) . a:word[1:]
    endfunction

A helper for simple ``balloonexpr`` usage that simply calls an external
command::

    function! misc#CommandBalloon(cmd) abort
        let l:cmd = stridx(a:cmd, '%s') == -1 ? a:cmd . ' %s' : a:cmd
        return systemlist(printf(l:cmd, shellescape(v:beval_text)))
    endfunction