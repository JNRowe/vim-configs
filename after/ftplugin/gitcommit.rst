``after/ftplugin/gitcommit.vim``
================================

.. _gitcommit-custom-maps:

Configure maps to insert common info to commit messages::

    call misc#MnemonicMap('Trailer', {'buffer': v:true, 'local': v:true})

    for s:type in ['Acked', 'Reviewed', 'Signed-off', 'Tested']
        execute 'nnoremap <buffer> <silent> [Trailer]' . tolower(s:type[0]) .
            \ ' :%!git interpret-trailers --trailer ' . shellescape(s:type . '-by') .
            \ '=' . shellescape(g:user_email) . '<CR>'
    endfor

Add a mapping for Sponsored-by_ header::

        function! s:insert_sponsor() abort
            call inputsave()
            let l:sponsor = input('Sponsor? ')
            call inputrestore()
            if l:sponsor ==# ''
                return
            endif
            execute ':silent %!git interpret-trailers --trailer Sponsored-by=' . shellescape(l:sponsor)
        endfunction
        nnoremap <buffer> <silent> [Trailer]p :call <SID>insert_sponsor()<CR>

A few co-workers are now decorating the commits with emojis for expressing
their types, and I’ll *try* to do so when committing to them::

    for [s:key, s:char] in [['new', '🌟'], ['del', '❌'], ['fix', '🐛'],
        \                   ['ref', '⟳']]
        silent execute 'iabbrev <buffer> _' . s:key . ' ' . s:char
    endfor

.. _Sponsored-by: https://blog.liw.fi/posts/2021/05/26/sponsored-by/
