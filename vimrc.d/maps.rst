``vimrc.d/maps.vim``
====================

Quickly move between buffers

.. code-block:: vim

    noremap <M-Left> :bprev<CR>
    noremap <M-Right> :bnext<CR>

I hate you *so* much right now

.. code-block:: vim

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

    I’ll add that this isn’t about hjkl, I’m truly not interested in that
    argument.  This is entirely about forcing me to use text objects more
    often.

Navigate tags with keys I find less annoying

.. code-block:: vim

    noremap <C-S-Left> <C-T>
    noremap <C-S-Right> <C-]>

Ctrl + up/down to skip paragraphs

.. code-block:: vim

    nnoremap <C-Up> {
    nnoremap <C-Down> }

Begin new line from anywhere

.. code-block:: vim

    inoremap <S-CR> <C-o>o
    inoremap <C-CR> <C-o>O

Make C-g verbose by default

.. code-block:: vim

    nnoremap <C-g> 2<C-g>

Map Q to reformat paragraphs

.. code-block:: vim

    nnoremap Q gqap

Man page, for easy access with custom keywordprg

.. code-block:: vim

    nnoremap <C-?> :<C-U>execute "Man" v:count "<C-R><C-W>"<CR>

Shift + arrows to select text

.. code-block:: vim

    nnoremap <S-Left> vh
    nnoremap <S-Right> vl
    nnoremap <S-Up> Vk
    nnoremap <S-Down> Vj

Logical Y mapping, like D

.. code-block:: vim

    nnoremap Y y$

Insert literal tab, for that once a year when it makes sense

.. code-block:: vim

    inoremap <silent> <S-Tab> <C-v><Tab>

Re-grab selection after {de,in}dent for simpler repeating

.. code-block:: vim

    vnoremap < <gv
    vnoremap > >gv

Visual mode indent that matches how it *feels* in insert

.. code-block:: vim

    vnoremap <Tab> >gv
    vnoremap <Backspace> <gv

<home> darts between start of line and start of text

.. code-block:: vim

    inoremap <silent> <home> <C-o>:call <SID>home_skip()<CR>
    nnoremap <silent> <home> :call <SID>home_skip()<CR>
    function! s:home_skip()
        if col('.') != 1
            normal! 0
        else
            normal! ^
        endif
    endfunction

Function keys

.. code-block:: vim

    nnoremap <silent> <F3> :set expandtab!<CR>
    " <[SC]-F4> toggles menu/toolbar in gvim
    function! s:call_build(...)
        let l:make = filereadable('build.ninja') ? 'ninja' : 'make'
        execute l:make . ' -C ' . expand('%:p:h') . ' ' . get(a:, 1, '')
    endfunction
    nnoremap <F10> :call <SID>call_build()<CR>
    nnoremap <S-F10> :call <SID>call_build('check')<CR>
    nnoremap <silent> <C-F11> :let @/ = ''<CR>

Window management

.. code-block:: vim

    nnoremap <C-w><Bar> <C-w>v
    nnoremap <C-w>- <C-w>s
    nnoremap <Tab> <C-w>p
    if has('quickfix')
        nnoremap <S-Tab> <C-w>P
    endif

Folding support maps

.. code-block:: vim

    if has('folding')
        nnoremap - zc
        nnoremap + zo

        vnoremap - zf
    endif

.. note::

    The previous mappings may not be to your liking, but I never use +/- for
    line movement.

Insert a modeline on the last line.  Given a count of 2 or more, write a longer
verbose modeline.  Think of it as analogous to [count]<C-g>

.. code-block:: vim

    nnoremap <silent> <Leader>ml :<C-u>call <SID>modeline_stub()<CR>

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
        $put =substitute(substitute(l:x, '\ \+', ' ', 'g'), ' $', '', '')
        call setpos('.', l:save_cursor)
    endfunction

Help related maps

.. code-block:: vim

    call MnemonicMap('Help', {'key': '?'})

    for s:t in ['pattern', 'quickref', 'registers']
        execute 'nnoremap [Help]' . s:t[0] . ' :help ' . s:t . '<CR>'
    endfor

    nnoremap <silent> [Help]c :helpclose<CR>

Perform word-ish searches in a new window, so we can maintain position in the
current window

.. code-block:: vim

    for s:k in ['*', '#']
        execute 'nnoremap <C-w>' . s:k  . ' <C-w>s' . s:k
        execute 'nnoremap <C-w>g' . s:k  . ' <C-w>sg' . s:k
    endfor

I don't use vi movement keys in command-line mode

.. code-block:: vim

    cnoremap <C-h> help<Space>
    cnoremap <C-S-h> vert help<Space>

.. code-block:: vim

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

.. code-block:: vim

    nnoremap <silent> <S-Space> :let &conceallevel = &conceallevel == 0 ? 2 : 0<CR>

Insert PWD at command line

.. code-block:: vim

    cmap <M-.> <C-r>=expand('%:p:h') . "/"<CR>
