``autoload/display.vim``
========================

.. include:: ../.includes/scriptencoding.rst

.. function:: add_line_highlight() -> None

    Highlight line.

::

    highlight link LineHighlightPrefix Search
    highlight link LineHighlightText Visual
    function! display#add_line_highlight() abort
        if !exists('w:line_highlights')
            let w:line_highlights = []
        endif
        if getline('.')[0] =~# '\s'
            let w:line_highlights += [
            \   matchadd('LineHighlightPrefix', '\%' . line('.') . 'l^\s\+',
            \            1000),
            \ ]
        endif
        let w:line_highlights += [
        \   matchadd('LineHighlightText', '\%' . line('.') . 'l^\s*\zs.*$',
        \            1000),
        \ ]
    endfunction

.. function:: clear_line_highlights() -> None

    Clear highlights created by :func:`add_line_highlight`

::

    function! display#clear_line_highlights() abort
        for l:id in w:line_highlights
            call matchdelete(l:id)
        endfor
        unlet w:line_highlights
    endfunction

.. function:: command_balloon(cmd: str) -> List[str]

    A helper for simple ``balloonexpr`` usage that simply calls an external
    command.

    :param cmd: If string contains ``%s`` then it will be replaced with
        ``v:beval_text``, else ``v:beval_text`` is appended
    :returns: Command output.

::

    function! display#command_balloon(cmd) abort
        let l:cmd = stridx(a:cmd, '%s') == -1 ? a:cmd . ' %s' : a:cmd
        return systemlist(printf(l:cmd, shellescape(v:beval_text)))
    endfunction

.. function:: conceal_toggle() -> None

    Toggle conceal on and off.

::

    function display#conceal_toggle() abort
        if &conceallevel == 0 && get(w:, 'orig_conceallevel')
            let &conceallevel = w:orig_conceallevel
            unlet w:orig_conceallevel
        else
            let w:orig_conceallevel = &conceallevel
            set conceallevel=0
        endif
    endfunction

.. function:: cursor_ping() -> None

    Ping the cursor position.

::

    function! display#cursor_ping() abort
        let [l:cursorline, l:cursorcolumn] = [&cursorline, &cursorcolumn]
        for _ in range(5)
            set cursorline! cursorcolumn!
            redraw
            sleep 15m
        endfor
        let [&cursorline, &cursorcolumn] = [l:cursorline, l:cursorcolumn]
    endfunction

.. function:: fold_text() -> str

    Custom foldtext formatting.

::

    function! s:shorten(text, line_str) abort
        let l:text = a:text
        " Non-getline() text length
        let l:base = 19
        let l:text_width = winwidth(0) - v:foldlevel - len(a:line_str) - l:base
        if strlen(l:text) > l:text_width
            let l:text = l:text[:l:text_width] . '…'
        endif
        return l:text
    endfunction

    function! display#fold_text() abort
        return substitute(
        \   foldtext(), '^+-\(-\+\)\s*\(\d\+\) lines: \(.*\)',
        \   {m -> repeat('─', v:foldlevel) . ' ' .
        \         <SID>shorten(m[3], m[2]) . '▼ ' . m[2] . ' lines'},
        \   ''
        \ )
    endfunction

.. note::

    Parsing ``foldtext()`` *may* be brittle, but manual creation is loads of
    work; whitespace, ``&cms`` |RegEx| escaping(C fex), ``&fdr``, no
    ``scanf()``, &c.

.. function:: gethighlightgroup(mark: Optional[str]) -> List[Dict[str, str]]

    Find syntax highlighting in use at the given location.

    :param mark: Location to display highlighting information for
    :returns: All highlighting rules active at location

::

    function! display#gethighlightgroup(...) abort
        let [l:lnum, l:col] = getpos(get(a:, 1, '.'))[1:2]

        let s:synname = {synid -> synIDattr(synid, 'name')}

        let l:groups = []
        for l:id in synstack(l:lnum, l:col)
            let l:groups += [{
            \   'hi': s:synname(l:id),
            \   'gr': s:synname(synIDtrans(l:id)),
            \ }]
        endfor
        return l:groups
    endfunction

.. function:: split_to_right() -> None

    Issue a “shift to right” for a window.

    There is an attempt made to ignore this directive when a portrait display
    can be detected.

::

    function! display#split_to_right() abort
        if has('vertsplit')
            if !exists('g:display_portrait')
                if executable('xdotool')
                    silent let [s:width, s:height] =
                    \   map(split(system('xdotool getdisplaygeometry')),
                    \       {_, s -> str2nr(s)})
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
