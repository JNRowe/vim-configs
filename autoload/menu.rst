``autoload/menu.vim``
=====================

.. function:: add_menu_items(heading: str, files: List[str]) -> None

    Utility function to add only existing files to a menu.

    :param heading: Submenu to add entries to
    :param files: Files to potentially add to menu

::

    function! s:add_menu_items(heading, files) abort
        for l:f in sort(a:files)
            let l:f = expand(l:f)
            if filereadable(l:f) || isdirectory(l:f)
                execute 'amenu L&ocations.' . escape(a:heading, ' ') .
                \   ' :e ' . l:f . '<CR>'
                break
            endif
        endfor
    endfunction

.. function:: define_menu(heading: str, items: Union[str, List[str], Dict[str, str], Dict[str, List[str]]], ...) -> None

    Define a new submenu for ``Locations`` menu item.

    Items can be specified as:

    ================ ========================================
    Signature        Maps to
    ================ ========================================
    ``str``          Potential filename
    ``[str]``        List of potential filenames
    ``{str: str}``   Submenu with potential filename
    ``{str: [str]}`` Submenu with list of potential filenames
    ================ ========================================

    :param heading: Submenu to add entries to
    :param items: Entries to add to submenu

::

    function! menu#define_menu(heading, items, ...) abort
        if type(a:items) is v:t_dict
            for [l:k, l:v] in sort(items(a:items))
                let l:files = type(l:v) is v:t_string ? split(l:v) : l:v
                call s:add_menu_items(a:heading . '.' . l:k, l:files)
            endfor
        else
            let l:files = type(a:items) is v:t_string ? [a:items] : a:items
            call s:add_menu_items(a:heading, l:files)
        endif
        for l:group in get(a:, 1, [])
            execute 'amenu L&ocations.' . escape(a:heading, ' ') .
            \   '.-Sep- :<CR>'
            call menu#define_menu(a:heading, l:group)
        endfor
    endfunction
