``localcfg/plugin_wordnet.vim.vim``
===================================

Add map to close wordnet_ window from anywhere::

    function WordnetCloseWin()
        if bufnr("__WordNet__") > -1
            exec bufnr("__WordNet__") . "bdelete!"
        endif
    endf

    nnoremap <silent> <Leader>wnq :call WordnetCloseWin()<CR>

We don’t care that the dictionary buffer has trailing whitespace::

    if has('autocmd')
        augroup jnrowe_wordnet
            autocmd BufNewFile __WordNet__ HideBadWhitespace
        augroup END
    endif

.. _wordnet: https://wordnet.princeton.edu/
