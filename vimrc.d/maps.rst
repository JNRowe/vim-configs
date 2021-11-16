``vimrc.d/maps.vim``
====================

.. include:: ../.includes/scriptencoding.rst

.. _switch-bufs:

Set up map to quickly :func:`move among buffers <switch_buf>`::

    noremap <silent> <M-Left> :<C-u>call keymaps#switch_buf(v:count1 * -1)<CR>
    noremap <silent> <M-Right> :<C-u>call keymaps#switch_buf(v:count1 * 1)<CR>

.. note::

    I *love* ``'hidden'``, as it really suits the way I work.  However, it also
    means I occasionally have to skip through things I don’t care about in
    ``:bnext``, and I don’t love that.  The above mapping skips the buffers
    I wouldn’t care about and provides a more useful *to me* version of buffer
    cycling.

I hate you *so* much right now::

    if exists('$VIM_DISABLE_CURSORS')
        for s:k in ['Up', 'Down', 'Left', 'Right']
            execute 'nnoremap <' . s:k . '> <nop>'
            execute 'inoremap <' . s:k . '> <nop>'
        endfor
    endif

.. note::

    I’ll add that this isn’t about :kbd:`[hjkl]` purism, I’m truly not
    interested in that argument.  This is entirely about forcing me to use
    :vimdoc:`text objects <motion.txt#text-objects>` more often.

Begin new line easily from within insert mode::

    inoremap <C-CR> <C-o>o
    inoremap <S-CR> <C-o>O

.. tip::

    The mnemonic here is :kbd:`<Shift>` opens *above* and :kbd:`<Ctrl>` open
    *below*, much like their position on many keyboards.

Make :kbd:`<C-g>` verbose by default::

    nnoremap <C-g> 2<C-g>

Map :kbd:`Q` to reformat paragraphs just as everyone else does::

    nnoremap Q gqap

.. tip::

    Should you have reason to need ``Ex`` mode, then you’ll probably find the
    :kbd:`gQ` interface nicer anyhow.

Easy access to man pages when using a custom ``'keywordprg'``::

    nnoremap <C-?> :<C-U>execute 'Man ' . v:count . ' <C-R><C-W>'<CR>

Logical :kbd:`Y` mapping, behaves like :kbd:`D`::

    nnoremap Y y$

.. note::

    This makes so much sense that it is even described in the :kbd:`Y` help
    text, and excellently describes the *benefit* that would come from breaking
    backwards compatibility.

Re-grab selection after {de,in}dent for easier repeating::

    vnoremap < <gv
    vnoremap > >gv

Visual mode indent that matches how it *feels* in insert::

    vnoremap <Tab> >gv
    vnoremap <Backspace> <gv

:kbd:`<Home>` darts between start of line and start of text::

    function! s:home_skip() abort
        if col('.') != 1
            normal! 0
        else
            normal! ^
        endif
    endfunction
    inoremap <silent> <home> <C-o>:call <SID>home_skip()<CR>
    nnoremap <silent> <home> :call <SID>home_skip()<CR>

Add :kbd:`<F10>` build bindings that are muscle memory reminders of my
childhood::

    nnoremap <F10> :call misc#call_build()<CR>
    nnoremap <S-F10> :call misc#call_build('check')<CR>

Open file under cursor, like ``netrw`` but :doc:`without the rest <disabled>`::

    if executable('xdg-open')
        nnoremap <silent> gx
        \   :call system('xdg-open ' . shellescape(expand('<cfile>:p')))<CR>
    endif

.. _window-management-maps:

Maps to jump Window management::

    nnoremap <C-w><Bar> <C-w>v
    nnoremap <C-w>- <C-w>s
    nnoremap <Tab> <C-w>p
    if has('quickfix')
        nnoremap <S-Tab> <C-w>P
    endif

.. tip::

    Imagine that :kbd:`<C-w>|` and :kbd:`<C-w>-` are cleaving the window to
    match the key.

.. _help-custom-maps:

Help related maps::

    call keymaps#mnemonic_map('Help', {'key': '?'})

    for s:t in ['function-list', 'pattern', 'quickref', 'registers']
        execute 'nnoremap [Help]' . s:t[0] . ' :help ' . s:t . '<CR>'
    endfor

    nnoremap <silent> [Help]c :helpclose<CR>

I don't use :command:`vi` movement keys in command-line mode, so we can use them
for shortcuts::

    cnoremap <C-h> vert help<Space>

:func:`Ping the cursor position <cursor_ping>` as a visual cue when returning to
a session::

    nnoremap <silent> <C-Space> :call display#cursor_ping()<CR>

Add map to toggle conceal support, which is useful when co-workers freak out
when you’re showing code::

    if has('conceal')
        nnoremap <silent> <M-Space> :call display#conceal_toggle()<CR>
    endif

.. image:: /.static/conceal_flip.png
   :alt: Screenshot of conceal mode toggling

Insert current buffer’s directory at command line::

    cmap <M-.> <C-r>=expand('%:p:h') . '/'<CR>

.. _scroll-wheel-override:

Scroll wheel moves through undo list, and through branches with :kbd:`<Shift>`.
Can’t for the life of me remember who was demoing something similar as
a feature, but thanks for the idea!

::

    for s:m in ['i', 'n']
        let s:break_insert = s:m ==# 'i' ? '<C-o>' : ''
        for [s:mod, s:key, s:cmd] in [
        \   ['', 'Up', 'u'], ['', 'Down', '<C-r>'],
        \   ['S-', 'Up', 'g-'], ['S-', 'Down', 'g+']
        \ ]
            execute s:m . 'noremap <' . s:mod . 'ScrollWheel' . s:key . '> '
            \   . s:break_insert . s:cmd
        endfor
    endfor

Make insert mode maps for accessing all completion modes without needless hand
stretching:::

    if has('insert_expand')
        for s:key in split('lnkti]fdvuos', '\zs')
            execute 'inoremap <silent> <LocalLeader>,' . s:key .
            \   ' <C-x><C-' . s:key . '>'
        endfor
    endif

Place cursor at the end of yanked region::

    vmap y yg`]

.. _display-custom-maps:

Add mappings to highlight lines::

    call keymaps#mnemonic_map('Display', {'key': 'D', 'modes': 'nv'})
    nnoremap <silent> [Display]lh :call display#add_line_highlight()<CR>
    nnoremap <silent> [Display]lc :call display#clear_line_highlights()<CR>

.. tip::

    This is extremely useful for showing other people code, and unlike simply
    using linewise visual mode you can maintain the highlights whilst doing
    other things.

Highlight matches for last search only within visual region::

    if has('extra_search')
        vnoremap <silent> [Display]ms
        \   :<C-u>execute 'match Search /\%V' . getreg('/') . '\%V/'<CR>
        nnoremap <silent> [Display]mc :match none<CR>
    endif

.. spelling::

    linewise
