``autoload/misc.vim``
=====================

.. _gethighlightgroup-function:

Find highlight group of the given location::

    function! misc#gethighlightgroup(...) abort
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

    function! misc#toggleflag(option, flag) abort
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

    function! misc#mnemonicmap(name, ...) abort
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

    function! misc#titleword(word) abort
        return toupper(a:word[0]) . a:word[1:]
    endfunction

A helper for simple ``balloonexpr`` usage that simply calls an external
command::

    function! misc#commandballoon(cmd) abort
        let l:cmd = stridx(a:cmd, '%s') == -1 ? a:cmd . ' %s' : a:cmd
        return systemlist(printf(l:cmd, shellescape(v:beval_text)))
    endfunction

Issue an immediate “shift to right” for a window, with an attempt made to skip
portrait displays.

::

    function! misc#split_to_right() abort
        if has('vertsplit')
            if !exists('g:display_portrait')
                if executable('xdotool')
                    silent let [s:width, s:height] =
                        \ map(split(system('xdotool getdisplaygeometry')),
                        \     {_, s -> str2nr(s)})
                    let g:display_portrait = s:width < s:height
                else
                    let g:display_portrait = v:none
                endif
            endif
            if g:display_portrait == v:false && winnr('$') > 1
                wincmd L
            endif
        endif
    endfunction

Insert a modeline on the last line of a buffer::

    function! misc#modeline_stub(verbose) abort
        let l:x = 'ft=' . &filetype . (&expandtab ? '' : ' noet')
        if a:verbose
            let l:x .= printf(
                \   ' ts=%d sw=%d tw=%d fdm=%s%s', &tabstop,
                \   &shiftwidth, &textwidth, &foldmethod,
                \   (&foldmethod ==# 'marker' ? ' fmr=' . &foldmarker : '')
                \ )
        endif
        let l:x = printf(&commentstring, ' vim: ' . l:x . ':')
        call append(line('$'), trim(substitute(l:x, '\ \+', ' ', 'g')))
    endfunction

Insert a git_ trailer::

    function! misc#add_git_trailer(key, ...) abort
        let l:value = get(a:, 1)
        if l:value == v:none
            call inputsave()
            let l:value = input(a:key . '? ')
            call inputrestore()
        endif
        if l:value ==# ''
            return
        endif
        let l:save_cursor = getcurpos()
        execute ':%!git interpret-trailers ' .
            \ '--trailer ' . a:key . '-by=' . shellescape(l:value)
        call setpos('.', l:save_cursor)
    endfunction

.. _git: https://www.git-scm.com/
