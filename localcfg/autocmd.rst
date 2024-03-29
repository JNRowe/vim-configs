``localcfg/autocmd.vim``
========================

.. include:: ../.includes/scriptversion.rst

::

    augroup jnrowe
        autocmd!

.. _disable-undo-file:

Don’t write undo data for temporary files::

        execute 'autocmd BufWritePre ' .. &backupskip .. ' setlocal noundofile'

.. caution::

    Using the value of ``'backupskip'`` is a simple way to synchronise these
    settings, but it does mean one needs to be aware of the :ref:`sourcing order
    <sourcing-order>` to prevent mistakes.

Use |vim|’s help for these documents::

        autocmd BufNewFile,BufRead ~/.vim/*.rst setlocal keywordprg=:help

Use project tags for these documents::

        autocmd BufNewFile,BufRead ~/.vim/* setlocal tags+=~/.vim/tags/TAGS

We don't want to edit patch backup files by accident [*again*]::

        autocmd BufRead *.orig set readonly

Buffers that are readonly don’t need to have spelling errors or line lengths
highlighted::

        autocmd FileType man setlocal nospell colorcolumn&
        autocmd BufReadPost * if !&modifiable |
        \       setlocal nospell colorcolumn& |
        \   endif

Issue an immediate “split to right” for documentation buffers::

        autocmd FileType help,man call display#split_to_right()

.. seealso::

    * :func:`display#split_to_right() <split_to_right>`

Attempt filetype detection after writing::

        autocmd BufWritePost * if empty(&filetype) | filetype detect | endif

Jump to the last known cursor position if possible::

        autocmd BufReadPost *
        \   if &filetype =~# '^git' && &filetype != 'gitconfig' |
        \       execute 'normal! gg' |
        \   else |
        \       call setpos('.', getpos("'\"")) |
        \   endif

.. note::

    Doesn’t restore saved position for :command:`git` buffers as that tends to
    not be useful.  If you are re-editing a :command:`git` buffer where it would
    be useful, such as when issuing a :command:`git commit --amend`, you can
    always jump manually using the :kbd:`'"` mark.

Make buffers created from standard input temporary by default::

        autocmd StdinReadPost * set buftype=nofile

.. warning::

    This is potentially dangerous as it could cause data loss, but I only use
    ``stdin`` buffers when *viewing* files.

Always do a full syntax refresh, as this is still fast enough on a netbook::

        autocmd BufEnter * syntax sync fromstart

Open ``quickfix`` window, if there are any entries::

        autocmd QuickFixCmdPost [^l]* belowright cwindow 5
        autocmd QuickFixCmdPost l* belowright lwindow 5

.. note::

    Five lines seems to be the magic number for *me*, as it provides both
    reasonable context on entries and doesn’t fill the screen.

.. _dynamic-cursorline:

Only highlight cursor line in active window::

        autocmd WinLeave * setlocal nocursorline
        autocmd WinEnter * setlocal cursorline

… and not when in insert::

        autocmd InsertEnter * setlocal nocursorline
        autocmd InsertLeave * setlocal cursorline

Search for project specific :file:`vimrc` and support files::

        autocmd BufRead * call misc#apply_project_locals()

.. seealso::

    * :func:`misc#apply_project_locals() <apply_project_locals>`

Add command to more easily edit the project specific files::

        command! -nargs=1
        \   -complete=customlist,completion#project_file_complete
        \   ProjectFile call misc#edit_project_file(<q-args>)

.. seealso::

    * :func:`misc#edit_project_file() <edit_project_file>`

::

    augroup END

.. spelling::

    readonly
