``after/ftplugin/gitcommit.vim``
================================

.. _gitcommit-custom-maps:

Configure maps to insert common info to commit messages::

    call MnemonicMap('Trailer', {'buffer': v:true, 'local': v:true})

    for s:type in ['Acked', 'Reviewed', 'Signed-off', 'Tested']
        execute 'nnoremap <buffer> <silent> [Trailer]' . tolower(s:type[0]) .
            \ ' :%!git interpret-trailers --trailer ' . shellescape(s:type . '-by') .
            \ '=' . shellescape(g:user_email) . '<CR>'
    endfor

A few co-workers are now decorating the commits with emojis for expressing
their types, and I’ll *try* to do so when committing to them::

    for [s:key, s:char] in [['new', '🌟'], ['del', '❌'], ['fix', '🐛'],
        \                   ['ref', '⟳']]
        silent execute 'iabbrev <buffer> _' . s:key . ' ' . s:char
    endfor
