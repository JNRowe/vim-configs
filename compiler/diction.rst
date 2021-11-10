``compiler/diction.vim``
========================

Configure diction_ support::

    setlocal errorformat=%f:%l:\ %m
    setlocal makeprg=diction\ -s\ %

If possible, enable language support::

    let s:lang = split(v:lang, '\.')[0]
    if filereadable('/usr/share/diction/' . s:lang)
        let &l:makeprg .= ' -L ' . s:lang
    endif

.. _diction: http://www.gnu.org/software/diction/diction.html
