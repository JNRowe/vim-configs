``localcfg/autocmd.vim``
========================

::

    augroup jnrowe
        autocmd!

Don’t write undo data for temporary files::

        execute 'autocmd BufWritePre /tmp/*,$TMP/*,' . g:xdg_cache_dir . '/* setlocal noundofile'

Use :command:`vim`’s help for these documents::

        autocmd BufRead ~/.vim/*.rst setlocal keywordprg=:help

We don't want to edit patch backup files by accident [*again*]::

        autocmd BufRead *.orig set readonly

Buffers that aren’t really for editing don’t need to have spelling errors
highlighted::

        autocmd FileType man,startify setlocal nospell

Highlights for read only buffers aren’t interesting::

        autocmd FileType help,man setlocal colorcolumn=""

Issue an immediate “split to right” for documentation buffers::

        autocmd FileType help,man call misc#split_to_right()

Attempt filetype detection after writing::

        autocmd BufWritePost *
            \ if empty(&filetype) |
            \   filetype detect |
            \ endif

Automatically :command:`chmod +x` shell scripts::

        autocmd BufWritePost *.sh silent call system('chmod +x -- ' . expand('%:p:S'))

.. note::

    Shelling out to :command:`chmod` is a lazy way to support the user’s
    :manpage:`umask(2)` setting without having to resort to craziness with
    ``getfperm()`` and ``setfperm()``

Jump to the last known cursor position if possible::

        autocmd BufReadPost *
            \ if &filetype =~# '^git' && &filetype != 'gitconfig' |
            \   execute 'normal! gg' |
            \ else |
            \   call setpos('.', getpos("'\"")) |
            \ endif

.. note::

    Doesn’t restore saved position for :command:`git` buffers as that tends
    to not be useful.  If you are re-editing a :command:`git` buffer where
    it would be useful, such as when issuing a :command:`git commit
    --amend`, you can always jump manually using the ``'"`` mark.

Make stdin buffers temporary by default.  Potentially dangerous as it
could cause data loss, but I only use them this way.

::

        autocmd StdinReadPost * set buftype=nofile

Turn off search highlighting when entering a buffer::

        autocmd BufEnter * nohlsearch

Turn off search highlighting when idle::

        autocmd CursorHold * nohlsearch | redraw

Always do a full syntax refresh, as this is still fast enough on a netbook::

        autocmd BufEnter * syntax sync fromstart

Open ``quickfix`` window, if there are any entries::

        autocmd QuickFixCmdPost * belowright cwindow 5

.. _dynamic-cursorline:

Only highlight cursor line in active window::

        autocmd WinLeave * setlocal nocursorline
        autocmd WinEnter * setlocal cursorline

… and not when in insert::

        autocmd InsertEnter * setlocal nocursorline
        autocmd InsertLeave * setlocal cursorline

Search for project specific :file:`vimrc` and support files::

        let s:project_env_dir = g:vim_data_dir . '/project_env/'

        function! s:meta_detect(file)
            if exists('b:meta_dir')
                return b:meta_dir
            endif
            let l:p = resolve(fnamemodify(a:file, ':p:h'))

            silent let l:output = systemlist('git -C ' . shellescape(l:p) . ' rev-parse --show-toplevel')
            if v:shell_error == 0 && len(l:output) == 1
                return s:project_env_dir . l:output[0]
            endif

            " Lazy method to handle scheme prefixed filenames
            let l:break = ''
            while l:p !=# l:break
                if isdirectory(l:p . '/.meta')
                    return s:project_env_dir . l:p . '/.meta'
                endif
                let l:break = l:p
                let l:p = fnamemodify(l:p, ':h')
            endwhile
            return v:none
        endfunction

        function! s:apply_project_locals()
            let b:meta_dir = s:meta_detect(expand('<afile>'))
            if type(b:meta_dir) != v:t_string
                return
            endif
            if !exists('b:meta_spell')
                let l:spf = b:meta_dir . &spelllang . '.' . &encoding . '.add'
                if filereadable(l:spf)
                    \ && index(split(&spellfile, ','), l:spf) == -1
                    execute 'setlocal spellfile+=' . l:spf
                endif
                let b:meta_spell = v:true
            endif
            for l:file in ['abbr.vim', 'project.vim']
                let l:var = 'b:meta_' . fnamemodify(l:file, ':r')
                if !exists(l:var) && filereadable(b:meta_dir . '/' . l:file)
                    execute 'source ' . b:meta_dir . '/' . l:file
                endif
                execute 'let ' . l:var . ' = v:true'
            endfor
        endfunction

        autocmd BufWinEnter * call <SID>apply_project_locals()

.. note::

    The reason we’re storing project specific files deep in
    ``g:vim_data_dir`` instead of under the project itself is so that we
    need not concern ourselves with the security implications of remote
    :file:`vimrc` snippets from random users and projects.

Add command to more easily edit the project specific files::

        function! s:edit_project_file(name)
            let b:meta_dir = s:meta_detect(expand('<afile>'))
            if type(b:meta_dir) != v:t_string
                return
            endif
            call mkdir(b:meta_dir, 'p')
            execute ':edit ' . b:meta_dir . '/' . a:name
        endfunction
        function! s:project_file(arglead, cmdline, cursorpos)
            return ['abbr.vim', 'project.vim']
        endfunction
        command! -nargs=1 -complete=customlist,<SID>project_file
            \ ProjectFile call <SID>edit_project_file(<q-args>)

::

    augroup END

.. _git: https://www.git-scm.com/
