``localcfg/abbr.vim``
=====================

.. include:: ../.includes/scriptencoding.rst

Common-ish mail abbreviations, that may also appear occasionally in other
contexts too::

    iabbrev AFAICR as far as I can remember
    iabbrev AFAIK as far as I know
    iabbrev AKA also known as
    iabbrev ASAP as soon as possible
    iabbrev FAF fire’n’forget
    iabbrev FINR fixed in the next release
    iabbrev FWIW for what it’s worth
    iabbrev FYI for your information
    iabbrev HTH hope that helps
    iabbrev IIRC if I remember correctly
    iabbrev IMHO in my humble opinion
    iabbrev IMNSHO in my not so humble opinion
    iabbrev IMO in my opinion
    iabbrev OTOH on the other hand
    iabbrev RTFM read the friendly manual
    iabbrev WDYT what do you think?
    iabbrev WIBNI wouldn’t it be nice if
    iabbrev YMMV your mileage may vary

Date and time input, all of which could easily be replaced with equivalent
snippets if I wasn’t so used to this now::

    for [s:key, s:fmt] in [['t', '%T'], ['d', '%F'], ['dt', '%FT%T%:z']]
        silent execute 'iabbrev <expr> _' . s:key .
            \ ' system("date +' . s:fmt . '")'
        silent execute 'iabbrev <expr> _u' . s:key .
            \ ' system("date -u +' . s:fmt . '")'
    endfor

.. note::

    We shell out to the system’s :command:`date` command here for a couple of
    reasons:

    * For :abbr:`UTC (Coordinated Universal Time)` support because
      :command:`vim` doesn’t expose :manpage:`gmtime(3)`
    * For ``%:z`` support in timezone display to match common
      :wikipedia:`ISO-8601 <ISO_8601>` styling

    If these were fixed we could switch to using :command:`vim`’s ``strftime``
    function, with the caveat that format strings are non-portable and
    that we’d need to be conditional on ``exists('*strftime')``.
