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

    set guioptions-=L
    set guioptions-=r

I don’t use the toolbar, and rarely want the menu::

    set guioptions-=T
    set guioptions-=m

… but, add :ref:`maps for quick toggle <gui-toggles>`.

Attempt to keep window size when toggling GUI items(menu, scrollbars, &c), as
I find display layout more important than number of columns.

::

    set guioptions+=k

Configure right mouse button to closer match the rest of my system::

    set mousemodel=popup_setpos

.. _gui-linenumbers:

Always display relative line numbers in the GUI, but show actual line number
on current line::

    set number
    set relativenumber

Shift insert works the same as in a terminal::

    noremap <S-Insert> <MiddleMouse>
    noremap! <S-Insert> <MiddleMouse>

Consolas is available on most of the systems I use, and feels reasonably nice.
If :command:`gvim` starts supporting ligatures upstream or with a cleaner patch,
then I’ll look for replacements.

::

    silent if len(systemlist('fc-list Inconsolata')) != 0
        let s:font_family = 'Inconsolata'
    else
        let s:font_family = 'Consolas'
    endif
    let s:font_size =  13
    let &guifont = s:font_family . ' ' . s:font_size

Add command to switch text size quickly.  Yeah, some of these are *huuuuuge*
but I’ll often pop up a snippet for discussion in a meeting and this really
helps.

::

    function! s:set_font(font)
        let l:font = len(a:font) != 0 ? a:font
            \ : s:font_family . '\ ' . s:font_size
        execute 'set guifont=' . l:font
    endfunction

    function! s:font_complete(arglead, cmdline, cursorpos)
        return [s:font_family . '\ ' . s:font_size, ]
            \ + map(range(8), {n -> s:font_family . '\ ' . (n * 8 + 16)})
    endfunction
    command! -nargs=? -complete=customlist,s:font_complete Fontsel
        \ call s:set_font(<q-args>)

Include non-standard server names in the window title::

    if has('title')  && has('clientserver')
        set titlestring+=%{v:servername!='GVIM'?'\ ['.v:servername.']':''}
    endif

Omnicompletion rocks, but :kbd:`<C-x><C-o>` doesn't::

    inoremap <C-Space> <C-x><C-o>

.. _gui-toggles:

Occasionally the toolbar can be useful for pairing co-worker, and from time
to time I use the menu myself.  So, we’ll add maps to quickly toggle them::

    if has('menu')
        nnoremap <silent> <S-F4> :call ToggleFlag('guioptions', 'm')<CR>
    endif
    if has('toolbar')
        nnoremap <silent> <C-F4> :call ToggleFlag('guioptions', 'T')<CR>
    endif

Hack to stop constant :repo:`dein <Shougo/dein.vim>` re-caching when switching
between GUI and non-GUI :command:`vim`::

    let g:loaded_bracketed_paste = v:true

.. note::

    This issue affects me so little it went unnoticed for four days, as I’m
    always using ‘clientserver’ and :command:`gvim`.  However, an errant
    :command:`git commit` from the wrong terminal causes a nearly three second
    penalty for recaching.
