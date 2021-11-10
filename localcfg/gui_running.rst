``localcfg/gui_running.vim``
============================

My chosen window managers handle boundaries far better than :command:`gvim`
does, so disable the default::

    set guiheadroom=0

Use console dialogs instead of jarring popups::

    set guioptions+=c

If toggled on, limit the horizontal scroll bar size::

    set guioptions+=h

Disable the left *and* right scrollbars::

    set guioptions-=L guioptions-=r

I don’t use the toolbar, and rarely want the menu::

    set guioptions-=T guioptions-=m

… but, add :ref:`maps for quick toggle <gui-toggles>`.

.. tip::

    The repeated use of ``guioptions`` above is required because using multiple
    characters with ``-=`` will only work if characters are consective, which
    can not be guaranteed.

Attempt to keep window size when toggling GUI items(menu, scrollbars, &c), as
I find display layout more important than the number of rows and columns.

::

    set guioptions+=k

Configure right mouse button to closer match the rest of my system::

    set mousemodel=popup_setpos

.. _gui-linenumbers:

Always display relative line numbers in the GUI, but show actual line number
on current line::

    set number
    set relativenumber

.. image:: /.static/relative_numbering.png
   :alt: Example of combined numbering

:kbd:`<S-Insert>` should work the same as in my terminals::

    noremap <S-Insert> <MiddleMouse>
    noremap! <S-Insert> <MiddleMouse>

Consolas — or Inconsolata_ — are available on all of the systems I use, and
*feel* really good.  If :command:`gvim` starts supporting ligatures upstream or
with a cleaner patch, then I’ll immediately look for replacements.

::

    for s:name in ['Inconsolata', 'Consolas', 'monospace']
        if len(systemlist('fc-list ' . shellescape(s:name . ' NF'))) != 0
            let g:font_family = s:name . ' NF'
            break
        elseif len(systemlist('fc-list ' . shellescape(s:name))) != 0
            let g:font_family = s:name
            break
        endif
    endfor
    let g:font_size =  13
    let &guifont = g:font_family . ' ' . g:font_size

.. note::

    The ``NF``-suffixed branch is here to prefer a nerd-fonts_ variation of
    a font if available.

Add command to switch text size quickly::

    command! -nargs=? -count -complete=custom,gui#font_complete Fontsel
        \ call gui#set_font(<q-args>)

.. tip::

    For minor size changes it is often easier to use ``set guifont=<Tab>``,
    while wishing that :kbd:`<C-{a,x}>` worked to {in,de}crement the number in
    the command line too.

Include non-standard server names in the window title::

    if has('title') && has('clientserver')
        let &titlestring .=
            \ '%{v:servername != "GVIM" ? " [" . v:servername . "]" : ""}'
    endif

Omnicompletion rocks, but :kbd:`<C-x><C-o>` doesn't::

    if has('insert_expand')
        inoremap <C-Space> <C-x><C-o>
    endif

.. _gui-toggles:

Occasionally the toolbar can be useful for pairing with a co-worker, and from
time to time I use the menu myself.  So, we’ll add maps to quickly toggle them::

    if has('menu')
        nnoremap <silent> <S-F4> :call misc#toggleflag('guioptions', 'm')<CR>
    endif
    if has('toolbar')
        nnoremap <silent> <C-F4> :call misc#toggleflag('guioptions', 'T')<CR>
    endif

Use a terminal window for command output::

    nnoremap <silent> <C-F1> :call misc#toggleflag('guioptions', '!')<CR>

.. note::

    This isn’t set for the full session as it can interact badly with
    plugins that don’t expect a full terminal window, and result in
    annoying interaction.

Hack to stop constant :repo:`dein <Shougo/dein.vim>` re-caching when switching
between GUI and non-GUI :command:`vim`::

    let g:loaded_bracketed_paste = v:true

.. note::

    This issue affects me so little it went unnoticed for four days, as I’m
    always using :command:`vim`’s ``clientserver`` support and :command:`gvim`.
    However, an errant :command:`git commit` from the wrong terminal can cause
    a nearly three second penalty for recaching without this kludge.

.. _Inconsolata: http://www.levien.com/type/myfonts/inconsolata.html
.. _nerd-fonts: https://github.com/ryanoasis/nerd-fonts
