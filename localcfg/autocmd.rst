``localcfg/autocmd.vim``
========================

::

    augroup jnrowe
        autocmd!

Add a default function for ``'omnifunc``::

        if exists('+omnifunc')
            autocmd FileType *
                \ if !exists('&omnifunc') |
                \   setlocal omnifunc=syntaxcomplete#Complete |
                \ endif
        endif

Create missing directories when saving files::

        autocmd BufWritePre *
            \ if !isdirectory(expand('%:h', v:true)) |
            \   call mkdir(expand('%:h', v:true), 'p') |
            \ endif

We don't want to edit patch backup files by accident [*again*]::

        autocmd BufRead *.orig set readonly

Buffers that aren’t really for editing don’t need to have spelling errors
highlighted::


        autocmd FileType man,startify set nospell

Highlights for read only buffers aren’t interesting::

        autocmd FileType help,man setlocal colorcolumn=""

.. code-block:: vim

        autocmd FileType css,html EmmetInstall

.. code-block:: vim

        autocmd FileType rst setlocal complete+=k/usr/share/dict/words

Attempt filetype detection after writing.::

        autocmd BufWritePost *
            \ if empty(&filetype) |
            \   filetype detect |
            \ endif

Automatically :command:`chmod +x` shell scripts::

        autocmd BufWritePost *.sh call setfperm(expand('%:p'), 'rwxr-xr-x')

Jump to the last known cursor position if possible::

        autocmd BufReadPost *
            \ if &filetype =~# '^git' |
            \   execute 'normal gg' |
            \ else |
            \   call setpos('.', getpos("'\"")) |
            \ endif

.. note::

    Doesn’t restore saved position for git buffers as that tends to not be
    useful.

Make stdin buffers temporary by default.  Potentially dangerous, but
I only use them this way.

.. code-block:: vim

        autocmd StdinReadPost * set buftype=nofile

Turn off search highlighting when entering a buffer::

        autocmd BufEnter * nohlsearch

Turn off search highlighting when idle::

        autocmd CursorHold * nohlsearch | redraw

Always do a full syntax refresh, as this is still fast enough on a netbook::

        autocmd BufEnter * syntax sync fromstart

Open quickfix window, if there are any entries::

        autocmd QuickFixCmdPost * belowright cwindow 5

Only highlight cursor line in active window::

        autocmd WinLeave * setlocal nocursorline
        autocmd WinEnter * setlocal cursorline

… and when in insert::

        autocmd InsertEnter * setlocal nocursorline
        autocmd InsertLeave * setlocal cursorline

Search upwards for a :file:`.meta` directory, and add any word
list(:file:`en.utf8.add`) or abbreviations(:file:`abbr.vim`) found to the
buffer’s settings::

        function! s:meta_detect(file)
            let l:p = resolve(fnamemodify(a:file, ':p:h'))

            while l:p != '/'
                if isdirectory(l:p . '/.meta')
                    return l:p . '/.meta'
                endif
                let l:p = fnamemodify(l:p, ':h')
            endwhile
        endfunction

        autocmd BufReadPost * if !exists('b:meta_dir') |
            \   let b:meta_dir = s:meta_detect(expand('<afile>')) |
            \ endif |
            \ if type(b:meta_dir) == v:t_string
            \       && index(split(&spellfile, ','),
            \                b:meta_dir . '/en.utf-8.add') == -1 |
            \   execute 'setlocal spellfile+=' . b:meta_dir . '/en.utf-8.add' |
            \   if !exists('b:meta_abbr')
            \           && filereadable(b:meta_dir . '/abbr.vim') |
            \       execute 'source ' . b:meta_dir . '/abbr.vim' |
            \       let b:meta_abbr = v:true |
            \   endif |
            \ endif

.. code-block:: vim

    augroup END
