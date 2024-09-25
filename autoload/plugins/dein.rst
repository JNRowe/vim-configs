``autoload/plugins/dein.vim``
=============================

.. include:: ../../.includes/vim9script.rst

.. function:: load_config(plugin: Optional[str])) -> None

    Load configuration file for plugin.

    When no ``plugin`` is provided we use default to loading the configuration
    file for current ``dein`` plugin.

    :param plugin: Name of plugin to load configuration file for

::

    def plugins#dein#load_config(plugin = '')
        const name = substitute(plugin ?? g:dein#plugin.name, '-', '_', 'g')
        execute 'source ~/.vim/localcfg/plugins/' .. name .. '.vim'
    enddef

.. function:: prefix(prefix: str, args: List[str]) -> List[str]

    Add a prefix to a list of strings.

    This greatly improves readability, in my opinion, for command definitions in
    ``dein#add`` calls.

    :param prefix: String to prepend
    :param args: Elements to operate on
    :returns: Strings with ``prefix`` prepended

::

    def plugins#dein#prefix(prefix: string, args: list<string>): list<string>
        return mapnew(args, (_, s) => prefix .. s)
    enddef

.. function:: suffix(suffix: str, args: List[str]) -> List[str]

    Add a suffix to a list of strings.

    This greatly improves readability, in my opinion, for command definitions in
    ``dein#add`` calls.

    :param suffix: String to append
    :param args: Elements to operate on
    :returns: Strings with ``suffix`` appended

::

    def plugins#dein#suffix(suffix: string, args: list<string>): list<string>
        return mapnew(args, (_, s) => s .. suffix)
    enddef

.. function:: has_exec(command: str) -> bool

    Check for installed command.

    ``executable()`` doesn’t cache results, so we’ll do it ourselves to handle
    repeated calls.

    :param command: Command to check for
    :returns: Whether command is installed

::

    var has_exec_cache = {}
    def plugins#dein#has_exec(command: string): bool
        if !has_key(has_exec_cache, command)
            s:has_exec_cache[command] = executable(command)
        endif
        return has_exec_cache[command]
    enddef
