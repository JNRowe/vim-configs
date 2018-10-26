``localcfg/plugin_wordnet.vim.vim``
===================================

.. code-block:: vim

    function WordnetCloseWin()
        if bufnr("__WordNet__") > -1
            exec bufnr("__WordNet__") . "bdelete!"
        endif
    endf

    nnoremap <silent> <Leader>wnq :call WordnetCloseWin()<CR>

.. code-block:: vim

    if has('autocmd')
        augroup jnrowe_wordnet
            autocmd BufNewFile __WordNet__ HideBadWhitespace
        augroup END
    endif
