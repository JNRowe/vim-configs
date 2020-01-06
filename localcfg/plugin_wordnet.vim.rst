``localcfg/plugin_wordnet.vim.vim``
===================================

Add map to close wordnet_ window from anywhere::

    function! s:wordnet_close_win() abort
        if bufnr('__WordNet__') > -1
            exec bufnr('__WordNet__') . 'bdelete!'
        endif
    endfunction

    nnoremap <silent> <Leader>wnq :call <SID>wordnet_close_win()<CR>

We don’t care that the dictionary buffer has trailing whitespace::

    if has('autocmd')
        augroup jnrowe_wordnet
            autocmd BufNewFile __WordNet__ HideBadWhitespace
        augroup END
    endif

.. _wordnet: https://wordnet.princeton.edu/
