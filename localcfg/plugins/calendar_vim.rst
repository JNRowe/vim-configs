``localcfg/plugins/calendar_vim.vim``
=====================================

.. include:: ../../.includes/scriptversion.rst

Configure look::

    const g:calendar_mark = 'left-fit'
    const g:calendar_monday = v:true
    const g:calendar_weeknm = 1
    const g:calendar_datetime = ''

Use |reST| formatting for note files::

    const g:calendar_filetype = 'rst'
    const g:calendar_diary_extension = '.rst'

We don’t care that the dictionary doesn’t recognise abbreviated day names or
that the calendar has trailing whitespace::

    if has('autocmd')
        augroup jnrowe_cal
            autocmd!
            autocmd BufEnter *Calendar setlocal nospell | HideBadWhitespace
        augroup END
    endif
