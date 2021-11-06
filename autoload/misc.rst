``autoload/misc.vim``
=====================

A helper for simple ``balloonexpr`` usage that simply calls an external
command::

    function! misc#commandballoon(cmd) abort
        let l:cmd = stridx(a:cmd, '%s') == -1 ? a:cmd . ' %s' : a:cmd
        return systemlist(printf(l:cmd, shellescape(v:beval_text)))
    endfunction

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

Insert all :command:`vim` options in to the current buffer::

    function! misc#insert_options() abort
        python3 << EOF
    for k in sorted(vim.options):
        vim.current.buffer.append(f'{k}={vim.options[k]!r}')
    EOF
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

Search for paths without all the escaping required by ``/``::

    function! misc#path_search(...) abort
        call inputsave()
        let @/ = input('Path? ', get(a:, 1, expand('%:p:h')), 'file')
        call inputrestore()
        if getreg('/') ==# ''
            return
        endif
        normal! n
    endfunction

.. note::

    This feels like exactly the kind of thing ``:promptfind`` would be
    useful for in :command:`gvim`, but it doesn’t support vim’s completion
    functionality.

Issue an “shift to right” for a window, with an attempt made to skip portrait
displays.

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

Convenience function to apply title case to a word::

    function! misc#titleword(word) abort
        return toupper(a:word[0]) . a:word[1:]
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

Many distributions package :command:`vim` with cherry picked patches, and
sometimes it is nice to know the current base version state::

    function! misc#version() abort
        let l:n = 1
        while has('patch' . n)
            let l:n += 1
        endwhile
        return printf('%d.%d.%04d', v:version / 100, v:version % 100, n - 1)
    endfunction
