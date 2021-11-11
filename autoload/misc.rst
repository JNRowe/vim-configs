``autoload/misc.vim``
=====================

.. function:: insert_options() -> None

    Insert all :command:`vim` options in to the current buffer.

::

    function! misc#insert_options() abort
        python3 << EOF
    for k in sorted(vim.options):
        vim.current.buffer.append(f'{k}={vim.options[k]!r}')
    EOF
    endfunction

.. function:: modeline_stub(verbose: bool) -> None

    Insert a modeline on the last line of a buffer

    :param verbose: If truthy, return a verbose modeline

::

    function! misc#modeline_stub(verbose) abort
        let l:x = 'ft=' . &filetype . (&expandtab ? '' : ' noet')
        if a:verbose
            let l:x .= printf(
            \   ' ts=%d sw=%d tw=%d fdm=%s%s',
            \   &tabstop, &shiftwidth, &textwidth, &foldmethod,
            \   (&foldmethod ==# 'marker' ? ' fmr=' . &foldmarker : '')
            \ )
        endif
        let l:x = printf(&commentstring, ' vim: ' . l:x . ':')
        call append(line('$'), trim(substitute(l:x, '\ \+', ' ', 'g')))
    endfunction

.. function:: path_search(path: Optional[str]) -> None

    Search for paths without all the escaping required by ``/``.

::

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

.. function:: titleword(word: str) -> str

    Convenience function to apply title case to a word.

    :param word: Text to operate on
    :returns: Title-cased input

::

    function! misc#titleword(word) abort
        return toupper(a:word[0]) . a:word[1:]
    endfunction

.. function:: toggleflag(option: str, flag: str) -> None

    Toggle an option.

    :param option: Option to toggle
    :param flag: Flag to change on given option

::

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

.. function:: version() -> str

    Find :command:`vim`’s base version.

    Many distributions package :command:`vim` with cherry picked patches, and
    sometimes it is nice to know the current base version.

    :returns: :command:`vim` version including the maximum consective patch

::

    function! misc#version() abort
        let l:n = 1
        while has('patch' . n)
            let l:n += 1
        endwhile
        return printf('%d.%d.%04d', v:version / 100, v:version % 100, n - 1)
    endfunction
