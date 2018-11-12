``localcfg/abbr.vim``
=====================

Common-ish mail abbreviations, that may also appear occasionally in other
contexts too::

    iabbrev AFAICR as far as I can remember
    iabbrev AFAIK as far as I know
    iabbrev AKA also known as
    iabbrev ASAP as soon as possible
    iabbrev FAF fire'n'forget
    iabbrev FINR fixed in the next release
    iabbrev FWIW for what it's worth
    iabbrev FYI for your information
    iabbrev HTH hope that helps
    iabbrev IIRC if I remember correctly
    iabbrev IMHO in my humble opinion
    iabbrev IMNSHO in my not so humble opinion
    iabbrev IMO in my opinion
    iabbrev OTOH on the other hand
    iabbrev RTFM read the friendly manual
    iabbrev WDYT what do you think?
    iabbrev WIBNI wouldn't it be nice if
    iabbrev YMMV your mileage may vary

Date and time input, all of which could easily be replaced with equivalent
snippets if I wasn’t so used to this now:

.. code-block:: vim

    iabbrev <expr> _t  strftime('%T')
    iabbrev <expr> _d  strftime('%F')
    iabbrev <expr> _dt strftime('%FT%T%z')
