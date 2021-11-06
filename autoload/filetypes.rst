``autoload/filetypes.vim``
==========================

Insert a `X-Advice header`_ above the first non-black line::

    function! filetypes#add_advice_header(prio, due) abort
        let l:save_cursor = getcurpos()
        call cursor(1, 1)
        let l:body_sep = search('^$', 'c')
        if l:body_sep != 0
            call append(l:body_sep - 1,
                \       'X-advice: ' . a:prio . ' read ' . a:due)
            let l:save_cursor[1] += 1
        endif
        call setpos('.', l:save_cursor)
    endfunction

.. warning::

    This only works when your buffer contains headers, such as when mutt_’s
    ``edit_headers`` option is set.  If your buffer doesn’t contain headers,
    then this will simply insert a body line to your email.

Insert a git_ trailer::

    function! filetypes#add_git_trailer(key, ...) abort
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

Configure ``+diff`` specific keymaps::

    function! filetypes#diff_maps() abort
        call keymaps#mnemonic_map('diff', {'key': 'i', 'local': v:true})

        for [s:key, s:cmd] in [
            \   ['w', 'call misc#toggleflag("diffopt", "iwhite")'],
            \   ['o', 'diffoff!'],
            \   ['p', 'diffput'],
            \   ['g', 'diffget'],
            \   ['u', 'diffupdate'],
            \ ]
            execute 'nnoremap <silent> <buffer> [diff]' . s:key . ' :' .
                \ s:cmd . '<CR>'
        endfor

        vnoremap <silent> <buffer> < :diffget<CR>
        vnoremap <silent> <buffer> > :diffput<CR>
    endfunction

.. _X-Advice header: http://www.nicemice.net/amc/advice-header/
.. _mutt: http://www.mutt.org/
.. _git: https://www.git-scm.com/
