``localcfg/gui_running.vim``
============================

.. include:: ../.includes/scriptversion.rst

My chosen window managers handle boundaries far better than :command:`gvim`
does, so disable the default::

    set guiheadroom=0

Use console dialogs instead of jarring popups::

    set guioptions+=c

Prefer dark theme if possible::

    set guioptions+=d

If toggled on, limit the horizontal scroll bar size::

    set guioptions+=h

Disable the left *and* right scrollbars::

    set guioptions-=L guioptions-=r

I don’t use the toolbar, and rarely want the menu::

    set guioptions-=T guioptions-=m

… but, add :ref:`maps for quick toggle <gui-toggles>`.

.. tip::

    The repeated use of ``'guioptions'`` above is required because using
    multiple characters with ``-=`` will only work if characters are
    consecutive, which can not be guaranteed.

Attempt to keep window size when toggling GUI items(menu, scrollbars, &c), as
I find display layout more important than the number of rows and columns.

::

    set guioptions+=k

Use sloppy focus :ref:`when menu and toolbar are disabled <gui-toggles>`::

    set mousefocus

Configure right mouse button to closer match the rest of my system::

    set mousemodel=popup_setpos

.. _gui-linenumbers:

Always display relative line numbers in the GUI, but show actual line number
on current line::

    set number
    set relativenumber

.. image:: /.static/relative_numbering.png
   :alt: Example of combined numbering

Attempt to save and restore window size in session files::

    set sessionoptions+=resize

:kbd:`<S-Insert>` should work the same as in my terminals::

    if empty(maparg('<S-Insert>', 'n'))
        noremap <S-Insert> <MiddleMouse>
        noremap! <S-Insert> <MiddleMouse>
    endif

.. note::

    This is default behaviour on Debian-based systems(see
    :file:`/usr/share/vim/vim*/debian.vim`), but is not common on other
    systems.

Consolas — or Inconsolata_ — are available on all of the systems I use, and
*feel* really good.  If :command:`gvim` starts supporting ligatures upstream or
with a cleaner patch, then I’ll immediately look for replacements.

::

    const s:fc_cmd = 'fc-list --quiet %s'
    for s:name in ['Consolas', 'Inconsolata', 'monospace']
        silent call printf(s:fc_cmd, shellescape(s:name .. ' NF'))->system()
        if v:shell_error == 0
            const g:font_family = s:name .. ' NF'
            break
        else
            silent call printf(s:fc_cmd, shellescape(s:name))->system()
            if v:shell_error == 0
                const g:font_family = s:name
                break
            endif
        endif
    endfor
    const g:font_size =  13
    let &guifont = g:font_family .. ' ' .. g:font_size

.. note::

    The ``NF``-suffixed branch is here to prefer a nerd-fonts_ variation of
    a font if available.

Add command to switch text size quickly::

    command! -nargs=? -count
    \   -complete=customlist,completion#set_font_complete Fontsel
    \   call gui#set_font(<q-args>)

.. seealso::

    * :func:`completion#set_font_complete() <set_font_complete>`

.. tip::

    For minor size changes it is often easier to use ``:set guifont=<Tab>``,
    while wishing that :kbd:`<C-{a,x}>` worked to {in,de}crement the number in
    the command line too.  If you’re super lazy — like me — and are simply
    trying to find the appropriate size for a new display then using ``:set
    guifont=<Tab><C-f>`` to open the command window will allow you to use
    :kbd:`<C-{a,x}>` to fiddle with sizes.

Include non-standard server names in the window title::

    if has('title') && has('clientserver')
        let &titlestring ..=
        \   '%{v:servername != "GVIM" ? " [" .. v:servername .. "]" : ""}'
    endif

Omnicompletion rocks, but :kbd:`<C-x><C-o>` doesn't::

    if has('insert_expand')
        inoremap <C-Space> <C-x><C-o>
    endif

.. _gui-toggles:

Occasionally the toolbar can be useful for pairing with a co-worker, and from
time to time I use the menu myself.  So, we’ll add maps to quickly toggle them::

    if has('menu')
        nnoremap <S-F4> <Cmd>call gui#toggle_guioption('m')<CR>
    endif
    if has('toolbar')
        nnoremap <C-F4> <Cmd>call gui#toggle_guioption('T')<CR>
    endif

.. seealso::

    * :func:`gui#toggle_guioption() <toggle_guioption>`

Use a terminal window for command output::

    nnoremap <C-F1> <Cmd>call misc#toggle_flag('guioptions', '!')<CR>

.. seealso::

    * :func:`misc#toggle_flag() <toggle_flag>`

.. note::

    This isn’t set for the full session as it can interact badly with
    plugins that don’t expect a full terminal window, and result in
    annoying interaction.

Hack to stop constant :repo:`dein <Shougo/dein.vim>` re-caching when switching
between GUI and non-GUI |vim|::

    const g:loaded_bracketed_paste = v:true

.. note::

    This issue affects me so little it went unnoticed for four days, as I’m
    always using |vim|’s ``clientserver`` support and :command:`gvim`.  However,
    an errant :command:`git commit` from the wrong terminal can cause a nearly
    three second penalty for re-caching without this kludge.

.. _Inconsolata: http://www.levien.com/type/myfonts/inconsolata.html
.. _nerd-fonts: https://github.com/ryanoasis/nerd-fonts

.. spelling::

    Consolas
    crement
    dialogs
