``localcfg/plugin_wordnet.vim.vim``
===================================

.. _wordnet-vim-custom-maps:

Use my custom maps::

    call keymaps#mnemonic_map('wordnet')

    for [s:key, s:cmd] in [
    \   ['o', 'WordNetOverviews(expand("<cword>"))'],
    \   ['c', 'misc#wordnet_close_win()'],
    \ ]
        execute 'nmap <silent> [wordnet]' . s:key . ' :call ' . s:cmd . '<CR>'
    endfor

We don’t care that the dictionary buffer has trailing whitespace::

    if has('autocmd')
        augroup jnrowe_wordnet
            autocmd BufNewFile __WordNet__ HideBadWhitespace
        augroup END
    endif
