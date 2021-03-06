``localcfg/plugin_calendar_vim.vim``
====================================

.. _calendar-vim-custom-maps:

Use my custom maps::

    let g:calendar_no_mappings = v:true

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

Configure look::

    let g:calendar_mark = 'left-fit'
    let g:calendar_monday = v:true
    let g:calendar_weeknm = 1
    let g:calendar_datetime = 'statusline'

Use reST_ formatting for note files::

    let g:calendar_filetype = 'rst'
    let g:calendar_diary_extension = '.rst'

We don’t care that the dictionary doesn’t recognise abbreviated day names or
that the calendar has trailing whitespace::

    if has('autocmd')
        augroup jnrowe_cal
            autocmd FileType calendar setlocal nospell | HideBadWhitespace
        augroup END
    endif

.. _reST: http://docutils.sourceforge.net/rst.html
