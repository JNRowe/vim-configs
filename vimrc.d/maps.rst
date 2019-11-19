``vimrc.d/maps.vim``
====================

.. _switch-bufs:

Set up map to quickly move between buffers.

.. note::

    I *love* ``hidden``, as it really suits the way I work.  However, it also
    means I occasionally have to skip through things I don’t care about in
    ``:bnext`` and I don’t love that.  The following function skips the buffers
    I wouldn’t care about and provides a more useful *to me* version of buffer
    cycling.

::

    function! s:switch_buf(count)
        let b:bufs = filter(range(1, bufnr('$')),
            \               'buflisted(v:val) && bufname(v:val) != ""')
        if len(b:bufs) < 2
            return
        endif
        let b:place = index(b:bufs, bufnr('%'))
        let b:buf = get(b:bufs, b:place + a:count,
            \           bufnr('%') == 1 ? bufnr('$') : b:bufs[0] )
        execute 'buffer ' . b:buf
    endfunction

    noremap <silent> <M-Left> :call <SID>switch_buf(-1)<CR>
    noremap <silent> <M-Right> :call <SID>switch_buf(1)<CR>

I hate you *so* much right now::

    if exists('$VIM_DISABLE_CURSORS')
        nnoremap <Up> <nop>
        inoremap <Up> <nop>

        nnoremap <down> <nop>
        inoremap <down> <nop>

        nnoremap <Left> <nop>
        nnoremap <Right> <nop>
        inoremap <Left> <nop>
        inoremap <Right> <nop>
    endif

.. note::

    I’ll add that this isn’t about :kbd:`[hjkl]` purism, I’m truly not
    interested in that argument.  This is entirely about forcing me to use text
    objects more often.

Navigate tags with keys I find less annoying::

    noremap <C-S-Left> <C-T>
    noremap <C-S-Right> <C-]>

Add oddly *verbose* maps to skip paragraphs::

    nnoremap <C-Up> {
    nnoremap <C-Down> }

… it may seem strange but when you’re diving about :kbd:`<C-Up>` is often easier
to hit.

Begin new line from anywhere::

    inoremap <S-CR> <C-o>o
    inoremap <C-CR> <C-o>O

Make :kbd:`<C-g>` verbose by default::

    nnoremap <C-g> 2<C-g>

Map Q to reformat paragraphs just like everyone else does::

    nnoremap Q gqap

Easy access to man pages when using a custom ``keywordprg``::

    nnoremap <C-?> :<C-U>execute 'Man' v:count '<C-R><C-W>'<CR>

Shift + arrows to select text like other applications::

    nnoremap <S-Left> vh
    nnoremap <S-Right> vl
    nnoremap <S-Up> Vk
    nnoremap <S-Down> Vj

Logical :kbd:`Y` mapping, behaves like :kbd:`D`::

    nnoremap Y y$

Re-grab selection after {de,in}dent for simpler repeating::

    vnoremap < <gv
    vnoremap > >gv

Visual mode indent that matches how it *feels* in insert::

    vnoremap <Tab> >gv
    vnoremap <Backspace> <gv

:kbd:`<Home>` darts between start of line and start of text::

    function! s:home_skip()
        if col('.') != 1
            normal! 0
        else
            normal! ^
        endif
    endfunction
    inoremap <silent> <home> <C-o>:call <SID>home_skip()<CR>
    nnoremap <silent> <home> :call <SID>home_skip()<CR>

Utility function to choose between ninja_ and make_ for builds::

    function! s:call_build(...)
        if filereadable('build.ninja')
            let l:make = executable('samu') ? 'samu' : 'ninja'
        else
            let l:make = 'make'
        endif
        execute l:make . ' -C ' . expand('%:p:h') . ' ' . get(a:, 1, '')
    endfunction

.. note::

    samurai_ is a :command:`ninja` reimplementation that turns up on
    a few machines I use.

Function keys are for executing common quick commands::

    nnoremap <silent> <F3> :set expandtab!<CR>
    nnoremap <F10> :call <SID>call_build()<CR>
    nnoremap <S-F10> :call <SID>call_build('check')<CR>
    nnoremap <silent> <C-F11> :let @/ = ''<CR>

Window management::

    nnoremap <C-w><Bar> <C-w>v
    nnoremap <C-w>- <C-w>s
    nnoremap <Tab> <C-w>p
    if has('quickfix')
        nnoremap <S-Tab> <C-w>P
    endif

.. tip::

    Imagine that :kbd:`<C-w>|` and :kbd:`<C-w>-` are cleaving the window to
    match the key.

Folding support maps::

    if has('folding')
        nnoremap - zc
        nnoremap + zo

        nnoremap z<Up> zk
        nnoremap z<Down> zj

        vnoremap - zf
    endif

.. note::

    The previous mappings may not be to your liking, but I never use :kbd:`[+-]`
    for line movement.

Insert a modeline on the last line.  Given a count of 2 or more, write a longer
verbose modeline.  Think of it as analogous to the behaviour of
``[count]<C-g>``.

::

    " Adapted from godlygeek’s vimrc
    function! s:modeline_stub()
        let l:save_cursor = getcurpos()
        let l:x = 'ft=' . &filetype . (&expandtab ? '' : ' noet')
        if v:count > 1
            let l:x .= printf(' ts=%d sw=%d tw=%d fdm=%s%s', &tabstop, &shiftwidth,
                \             &textwidth, &foldmethod,
                \            (&foldmethod == 'marker' ? ' fmr=' . &fmr : ''))
        endif
        let l:x = printf(&commentstring, ' vim: ' . l:x . ':')
        $put =trim(substitute(l:x, '\ \+', ' ', 'g'))
        call setpos('.', l:save_cursor)
    endfunction
    command! Modeline call s:modeline_stub()

Help related maps::

    call MnemonicMap('Help', {'key': '?'})

    for s:t in ['pattern', 'quickref', 'registers']
        execute 'nnoremap [Help]' . s:t[0] . ' :help ' . s:t . '<CR>'
    endfor

    nnoremap <silent> [Help]c :helpclose<CR>

Perform word-ish searches in a new window, so we can maintain position in the
current window::

    for s:k in ['*', '#']
        execute 'nnoremap <C-w>' . s:k  . ' <C-w>s' . s:k
        execute 'nnoremap <C-w>g' . s:k  . ' <C-w>sg' . s:k
    endfor

I don't use :command:`vi` movement keys in command-line mode, so we can use them
for shortcuts::

    cnoremap <C-h> help<Space>
    cnoremap <C-S-h> vert help<Space>

Ping the cursor position as a visual cue when returning to a session::

    function! s:cursor_ping()
        let l:cursorline = &cursorline
        let l:cursorcolumn = &cursorcolumn
        for _ in range(5)
            set cursorline! cursorcolumn!
            redraw
            sleep 15m
        endfor
        let &cursorline = l:cursorline
        let &cursorcolumn = l:cursorcolumn
    endfunction
    nmap <silent> <C-Space> :call <SID>cursor_ping()<CR>

Add map to toggle conceal support, which is useful when co-worker’s freak out
when you’re showing code::

    if has('conceal')
        nnoremap <silent> <S-Space>
            \ :let &conceallevel = &conceallevel == 0 ? 2 : 0<CR>
    endif

.. image:: /.static/conceal_flip.png
   :alt: Screenshot of conceal mode toggling

Insert current buffer’s directory at command line::

    cmap <M-.> <C-r>=expand('%:p:h') . '/'<CR>

Scroll wheel moves through undo list, and through branches with :kbd:`<Shift>`.
Can’t for the life of me remember who was demoing something similar as
a feature, but thanks for the idea!

::

    for s:m in ['i', 'n']
        let s:break_insert = s:m == 'i' ? '<C-o>' : ''
        for [s:mod, s:key, s:cmd] in [
            \  ['', 'Up', 'u'], ['', 'Down', '<C-r>'],
            \  ['S-', 'Up', 'g-'], ['S-', 'Down', 'g+']
            \ ]
            execute s:m . 'noremap <' . s:mod . 'ScrollWheel' . s:key . '> '
                \ . s:break_insert . s:cmd
        endfor
    endfor

Make insert mode maps for accessing all completion modes without needless hand
stretching:::

    for s:key in split('lnkti]fdvuos', '\zs')
        execute 'inoremap <silent> <LocalLeader>,' . s:key .
            \ ' <C-x><C-' . s:key . '>'
    endfor

Place cursor at the end of yanked region::

    vmap y y`]

.. _ninja: https://ninja-build.org/
.. _make: https://www.gnu.org/software/make/make.html
.. _samurai: https://github.com/michaelforney/samurai
