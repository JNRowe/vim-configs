``localcfg/abbr.vim``
=====================

.. include:: ../.includes/scriptencoding.rst

Common-ish mail abbreviations, that may also appear occasionally in other
contexts too::

    inoreabbrev AFAICR as far as I can remember
    inoreabbrev AFAIK as far as I know
    inoreabbrev AKA also known as
    inoreabbrev ASAP as soon as possible
    inoreabbrev FAF fire’n’forget
    inoreabbrev FINR fixed in the next release
    inoreabbrev FWIW for what it’s worth
    inoreabbrev FYI for your information
    inoreabbrev HTH hope that helps
    inoreabbrev IIRC if I remember correctly
    inoreabbrev IMHO in my humble opinion
    inoreabbrev IMNSHO in my not so humble opinion
    inoreabbrev IMO in my opinion
    inoreabbrev OTOH on the other hand
    inoreabbrev RTFM read the friendly manual
    inoreabbrev TPTB the powers that be
    inoreabbrev TPTW the powers that were
    inoreabbrev WDYT what do you think?
    inoreabbrev WIBNI wouldn’t it be nice if
    inoreabbrev YMMV your mileage may vary

.. note::

    The main reason these are here despite their common use *as* abbreviations
    is for communicating with people who don’t normally experience mail.

Date and time input, all of which could easily be replaced with equivalent
snippets if I wasn’t so used to this now::

    for [s:key, s:fmt] in [['t', '%T'], ['d', '%F'], ['dt', '%FT%T%:z']]
        silent execute 'inoreabbrev <expr> _' . s:key .
        \   ' system("date +' . s:fmt . '")'
        silent execute 'inoreabbrev <expr> _u' . s:key .
        \   ' system("date -u +' . s:fmt . '")'
    endfor

.. note::

    We shell out to the system’s :command:`date` command here for a couple of
    reasons:

    * For :abbr:`UTC (Coordinated Universal Time)` support because |vim| doesn’t
      expose :manpage:`gmtime(3)`
    * For ``%:z`` support in timezone display to match common
      :wikipedia:`ISO-8601 <ISO_8601>` styling

    If these were fixed we could switch to using |vim|’s ``strftime()``
    function, with the caveat that format strings are non-portable and that we’d
    need to be conditional on ``exists('*strftime')``.

.. spelling::

    timezone
