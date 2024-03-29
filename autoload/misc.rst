``autoload/misc.vim``
=====================

.. include:: ../.includes/scriptversion.rst

.. function:: apply_project_locals() -> None

    Find and process project-specific configuration files.

::

    function! misc#apply_project_locals() abort
        let b:meta_dir = misc#meta_detect(expand('<afile>'))
        if type(b:meta_dir) != v:t_string
            return
        endif
        if !exists('b:meta_spell')
            const l:spf = printf('%s%s.%s.add', b:meta_dir, &spelllang,
            \                    &encoding)
            if filereadable(l:spf)
            \   && index(split(&spellfile, ','), l:spf) == -1
                execute 'setlocal spellfile+=' .. l:spf
            endif
            let b:meta_spell = v:true
        endif
        for l:file in ['abbr.vim', 'project.vim']
            let l:var = 'b:meta_' .. fnamemodify(l:file, ':r')
            if !exists(l:var)
                let l:file_path = b:meta_dir .. '/' .. l:file
                if filereadable(l:file_path)
                    execute 'source ' .. l:file_path
                endif
            endif
            let {l:var} = v:true
        endfor
    endfunction

.. function:: call_build(target: Optional[str]) -> None

    Utility function to run a build.

    This supports ninja_ and make_, and prefers :command:`ninja` when both
    build files exist.

    :param target: Item to build, or build tool’s default if not given.

::

    function! misc#call_build(...) abort
        if filereadable('build.ninja')
            let &makeprg = executable('samu') ? 'samu' : 'ninja'
        else
            set makeprg=make
        endif
        execute printf('make -C %s %s', getcwd(), get(a:, 1, ''))
    endfunction

.. note::

    :repo:`samurai <michaelforney/samurai>` is a :command:`ninja`
    reimplementation that turns up on a few machines I use.

.. function:: disable_plugin(plugin: str) -> None

    Mark a function as loaded to prevent loading.

    This is purely to remove duplication in setup.

    :param plugin: Name of the plugin to shadow

::

    function! misc#disable_plugin(str) abort
        let g:loaded_{a:str} = v:true
    endfunction

.. function:: edit_project_file(name: str) -> None

    Edit project-specific configuration file.

    :param name: Configuration file to edit

::

    function! misc#edit_project_file(name) abort
        let b:meta_dir = misc#meta_detect(expand('<afile>'))
        if type(b:meta_dir) != v:t_string
            return
        endif
        if !isdirectory(b:meta_dir)
            call mkdir(b:meta_dir, 'p')
        endif
        execute printf(':edit %s/%s', b:meta_dir, a:name)
    endfunction


.. function:: get_qf_title(type: str) -> str

    Return title of active quickfix list.

    :param type: Type of quickfix list to operate on
    :returns: Window title

::

    function! misc#get_qf_title(type) abort
        const l:type = a:type[0] ==# 'q' ? 'qf' : 'loc'
        execute printf('call get%slist(%s#{title: v:true}).title',
        \              l:type, (l:type ==# 'loc' ? '0, ' : ''))
    endfunction

.. function:: insert_options() -> None

    Insert all |vim| options in to the current buffer.

::

    function! misc#insert_options() abort
        python3 << EOF
    for k in sorted(vim.options):
        vim.current.buffer.append(f'{k}={vim.options[k]!r}')
    EOF
    endfunction

.. function:: meta_detect(file: str) -> Optional[str]

    Find location for project-specific configuration files.

    :param file: Location to search for directory from
    :returns: Directory for project-specific configuration files, if
        possible

::

    const s:project_env_dir = g:vim_data_dir .. '/project_env/'

    function! misc#meta_detect(file) abort
            if exists('b:meta_dir')
                return b:meta_dir
            endif
            let l:p = resolve(fnamemodify(a:file, ':p:h'))

            const l:cmd = printf('git -C %s rev-parse --show-toplevel',
            \                    shellescape(l:p))
            silent const l:output = systemlist(l:cmd)
            if v:shell_error == 0 && len(l:output) == 1
                return s:project_env_dir .. l:output[0]
            endif

            " Lazy method to handle scheme prefixed filenames
            let l:break = ''
            while l:p !=# l:break
                if isdirectory(l:p .. '/.meta')
                    return printf('%s%s/.meta', s:project_env_dir, l:p)
                endif
                let l:break = l:p
                let l:p = fnamemodify(l:p, ':h')
            endwhile
            return v:none
        endfunction

.. note::

    The reason we’re storing project specific files deep in ``g:vim_data_dir``
    instead of under the project itself is so that we need not concern ourselves
    with the security implications of remote :file:`vimrc` snippets from random
    users and projects.

.. function:: modeline_stub(verbose : bool = False) -> None

    Insert a modeline on the last line of a buffer

    :param verbose: If truthy, return a verbose modeline

::

    function! misc#modeline_stub(verbose = v:false) abort
        let l:x = printf(' vim: ft=%s%s', &filetype, &expandtab ? '' : ' noet')
        if a:verbose
            let l:x ..= printf(
            \   ' ts=%d sw=%d tw=%d fdm=%s%s',
            \   &tabstop, &shiftwidth, &textwidth, &foldmethod,
            \   (&foldmethod ==# 'marker' ? ' fmr=' .. &foldmarker : '')
            \ )
        endif
        if !empty(&commentstring)
            let l:x = printf(&commentstring, l:x)
        endif
        let l:x ..= ':'
        call substitute(l:x, '\ \+', ' ', 'g')->trim()->append('$')
    endfunction

.. function:: path_search(path: Optional[str]) -> None

    Search for paths without all the escaping required by ``/``.

::

    function! misc#path_search(...) abort
        call inputsave()
        let @/ = input('Path? ', get(a:, 1, expand('%:p:h')), 'file')
        call inputrestore()
        if getreg('/') ==# ''
            return
        endif
        normal! n
    endfunction

.. note::

    This feels like exactly the kind of thing ``:promptfind`` would be
    useful for in :command:`gvim`, but it doesn’t support vim’s completion
    functionality.

.. function:: preserve_layout(command: str) -> None

    Execute command and preserve original layout.

    :param command: Command to execute

::

    function! misc#preserve_layout(command) abort
        const l:view = winsaveview()
        execute a:command
        call winrestview(l:view)
    endfunction

.. function:: print_option(option: str) -> None

    Pretty print an option’s value.

    :param option: Option to display

::

    function! misc#print_option(value) abort
        const l:value = eval(a:value[0] ==# '&' ? a:value : '&' .. a:value)
        echo sort(split(l:value, ','))->join("\n")
    endfunction

.. function:: scissors() -> None

    Place perforation-style lines around the given range.

::

    function! misc#scissors() abort range
        const l:max_len = getline(a:firstline, a:lastline)->map(
        \   {_, s -> strdisplaywidth(s)}
        \ )->max()
        const l:bound = &textwidth == 0 ? l:max_len : min([l:max_len,
        \                                                  &textwidth])
        const l:perf = (l:bound / 2) - 1
        const l:marker = printf('%s%%s%s', repeat('-', l:perf),
        \                       repeat('-', l:perf + (l:perf % 2)))

        call append(a:firstline - 1, printf(l:marker, '8<'))
        call append(a:lastline + 1, printf(l:marker, '>8'))
    endfunction

.. function:: str2chars(str: str) -> List[str]

    Convert a string to a list of characters.

    :param str: String to convert
    :returns: Individual characters from input

::

    function! misc#str2chars(str) abort
        return split(a:str, '\zs')
    endfunction

.. function:: title_word(word: str) -> str

    Convenience function to apply title case to a word.

    :param word: Text to operate on
    :returns: Title-cased input

::

    function! misc#title_word(word) abort
        return toupper(slice(a:word, 0, 1)) .. slice(a:word, 1)
    endfunction

.. function:: toggle_flag(option: str, flag: str) -> None

    Toggle an option.

    :param option: Option to toggle
    :param flag: Flag to change on given option

::

    function! misc#toggle_flag(option, flag) abort
        const l:optstr = eval('&' .. a:option)
        if stridx(l:optstr, ',') == -1
            " Simple char options like 'fo'
            const l:flip = '+-'[l:optstr =~# a:flag]
        else
            " Comma lists options like 'cot'
            const l:flip = '+-'[index(split(l:optstr, ','), a:flag) != -1]
        endif
        execute printf('set %s%s=%s', a:option, l:flip, a:flag)
    endfunction

.. function:: version() -> str

    Find |vim|’s base version.

    Many distributions package |vim| with cherry picked patches, and sometimes
    it is nice to know the current base version.

    :returns: |vim| version including the maximum consecutive patch

::

    function! misc#version() abort
        let l:n = 1
        while has('patch' .. n)
            let l:n += 1
        endwhile
        return printf('%d.%d.%04d', v:version / 100, v:version % 100, n - 1)
    endfunction

.. _ninja: https://ninja-build.org/
.. _make: https://www.gnu.org/software/make/make.html
