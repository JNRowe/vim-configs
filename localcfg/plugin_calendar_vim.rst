``localcfg/plugin_calendar_vim.vim``
====================================

.. code-block:: vim

    call MnemonicMap('Calendar')

    for [s:key, s:cmd] in [
        \   ['v', ''],
        \   ['h', 'H'],
        \   ['f', 'T'],
        \   ['r', 'VR'],
        \ ]
        execute 'nnoremap <silent> [Calendar]' . s:key . ' '
            \ ':Calendar' . s:cmd . '<CR>'
    endfor

.. code-block:: vim

    let g:calendar_no_mappings = v:true
    let g:calendar_mark = 'left-fit'
    let g:calendar_monday = v:true
    let g:calendar_weeknm = 1
    let g:calendar_datetime = 'statusline'
    let g:calendar_filetype = 'rst'

.. code-block:: vim

    if has('autocmd')
        augroup jnrowe_cal
            autocmd FileType calendar HideBadWhitespace
        augroup END
    endif
