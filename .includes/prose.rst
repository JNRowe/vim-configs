Set useful defaults for formatting prose::

    setlocal formatoptions+=2a
    setlocal textwidth=72

If par_ is available we’ll use it::

    if executable('par-format')
        setlocal formatprg=par-format\ -w72eq
    elseif executable('par')
        setlocal formatprg=par\ -w72eq
    endif

.. _par: http://www.nicemice.net/par/
