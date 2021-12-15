``autoload/plugins/dein.vim``
=============================

.. function:: prefix(prefix: str, args: List[str]) -> List[str]

    Add a prefix to a list of strings.

    This greatly improves readability, in my opinion, for command definitions in
    ``dein#add`` calls.

    :param prefix: String to prepend
    :param args: Elements to operate on
    :returns: Strings with ``prefix`` prepended

::

    function! plugins#dein#prefix(prefix, args) abort
        return map(a:args, {_, s -> a:prefix . s})
    endfunction

.. function:: suffix(suffix: str, args: List[str]) -> List[str]

    Add a suffix to a list of strings.

    This greatly improves readability, in my opinion, for command definitions in
    ``dein#add`` calls.

    :param suffix: String to append
    :param args: Elements to operate on
    :returns: Strings with ``suffix`` appended

::

    function! plugins#dein#suffix(suffix, args) abort
        return map(a:args, {_, s -> s . a:suffix})
    endfunction

.. function:: has_exec(command: str) -> bool

    Check for installed command.

    ``executable()`` doesn’t cache results, so we’ll do it ourselves to handle
    repeated calls.

    :param command: Command to check for
    :returns: Whether command is installed

::

    let s:has_exec_cache = {}
    function! plugins#dein#has_exec(command) abort
        if !has_key(s:has_exec_cache, a:command)
            let s:has_exec_cache[a:command] = executable(a:command)
        endif
        return s:has_exec_cache[a:command]
    endfunction
