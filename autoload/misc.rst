``autoload/misc.vim``
=====================

.. include:: ../.includes/vim9script.rst

.. function:: apply_project_locals() -> None

    Find and process project-specific configuration files.

::

    def misc#apply_project_locals()
        b:meta_dir = misc#meta_detect(expand('<afile>'))
        if type(b:meta_dir) != v:t_string
            return
        endif
        if !exists('b:meta_spell')
            const spf = printf('%s%s.%s.add', b:meta_dir, &spelllang,
                               &encoding)
            if filereadable(spf) && index(split(&spellfile, ','), spf) == -1
                execute 'setlocal spellfile+=' .. spf
            endif
            b:meta_spell = v:true
        endif
        var var_name: string
        var file_path: string
        for file in ['abbr.vim', 'project.vim']
            var_name = 'b:meta_' .. fnamemodify(file, ':r')
            if !exists(var_name)
                file_path = b:meta_dir .. '/' .. file
                if filereadable(file_path)
                    execute 'source ' .. file_path
                endif
            endif
            execute var_name .. ' = v:true'
        endfor
    enddef

.. function:: call_build(target: Optional[str]) -> None

    Utility function to run a build.

    This supports ninja_ and make_, and prefers :command:`ninja` when both
    build files exist.

    :param target: Item to build, or build tool’s default if not given.

::

    def misc#call_build(target = '')
        if filereadable('build.ninja')
            &makeprg = executable('samu') ? 'samu' : 'ninja'
        else
            set makeprg=make
        endif
        execute printf('make -C %s %s', getcwd(), target)
    enddef

.. note::

    :repo:`samurai <michaelforney/samurai>` is a :command:`ninja`
    reimplementation that turns up on a few machines I use.

.. function:: disable_plugin(plugin: str) -> None

    Mark a function as loaded to prevent loading.

    This is purely to remove duplication in setup.

    :param plugin: Name of the plugin to shadow

::

    def misc#disable_plugin(str: string)
        execute 'g:loaded_' .. str .. ' = v:true'
    enddef

.. function:: edit_project_file(name: str) -> None

    Edit project-specific configuration file.

    :param name: Configuration file to edit

::

    def misc#edit_project_file(name: string)
        b:meta_dir = misc#meta_detect(expand('<afile>'))
        if type(b:meta_dir) != v:t_string
            return
        endif
        if !isdirectory(b:meta_dir)
            mkdir(b:meta_dir, 'p')
        endif
        execute printf(':edit %s/%s', b:meta_dir, name)
    enddef


.. function:: get_qf_title(type: str) -> str

    Return title of active quickfix list.

    :param type: Type of quickfix list to operate on
    :returns: Window title

::

    def misc#get_qf_title(type: string): string
        const type = type[0] ==# 'q' ? 'qf' : 'loc'
        execute printf('call get%slist(%s#{title: v:true}).title',
                       type, (type ==# 'loc' ? '0, ' : ''))
    enddef

.. function:: insert_options() -> None

    Insert all |vim| options in to the current buffer.

::

    def misc#insert_options()
        python3 << EOF
    for k in sorted(vim.options):
        vim.current.buffer.append(f'{k}={vim.options[k]!r}')
    EOF
    enddef

.. function:: meta_detect(file: str) -> Optional[str]

    Find location for project-specific configuration files.

    :param file: Location to search for directory from
    :returns: Directory for project-specific configuration files, if
        possible

::

    const project_env_dir = g:vim_data_dir .. '/project_env/'

    def misc#meta_detect(file: string): string
        if exists('b:meta_dir')
            return b:meta_dir
        endif
        var p = resolve(fnamemodify(file, ':p:h'))

        const cmd = printf('git -C %s rev-parse --show-toplevel',
                            shellescape(p))
        silent const output = systemlist(cmd)
        if v:shell_error == 0 && len(output) == 1
            return project_env_dir .. output[0]
        endif

        # Lazy method to handle scheme prefixed filenames
        var break = ''
        while p !=# break
            if isdirectory(p .. '/.meta')
                return printf('%s%s/.meta', project_env_dir, p)
            endif
            break = p
            p = fnamemodify(p, ':h')
        endwhile
        return ''
    enddef

.. note::

    The reason we’re storing project specific files deep in ``g:vim_data_dir``
    instead of under the project itself is so that we need not concern ourselves
    with the security implications of remote :file:`vimrc` snippets from random
    users and projects.

.. function:: modeline_stub(verbose : bool = False) -> None

    Insert a modeline on the last line of a buffer

    :param verbose: If truthy, return a verbose modeline

::

    def misc#modeline_stub(verbose = v:false)
        var x = printf(' vim: ft=%s%s', &filetype, &expandtab ? '' : ' noet')
        if verbose
            x ..= printf(
                ' ts=%d sw=%d tw=%d fdm=%s%s',
                &tabstop, &shiftwidth, &textwidth, &foldmethod,
                (&foldmethod ==# 'marker' ? ' fmr=' .. &foldmarker : '')
            )
        endif
        if !empty(&commentstring)
            x = printf(&commentstring, x)
        endif
        x ..= ':'
        substitute(x, '\ \+', ' ', 'g')->trim()->append('$')
    enddef

.. function:: path_search(path: Optional[str]) -> None

    Search for paths without all the escaping required by ``/``.

::

    def misc#path_search(path = '')
        inputsave()
        @/ = input('Path? ', path ?? expand('%:p:h'), 'file')
        inputrestore()
        if getreg('/') ==# ''
            return
        endif
        normal! n
    enddef

.. note::

    This feels like exactly the kind of thing ``:promptfind`` would be
    useful for in :command:`gvim`, but it doesn’t support vim’s completion
    functionality.

.. function:: preserve_layout(command: str) -> None

    Execute command and preserve original layout.

    :param command: Command to execute

::

    def misc#preserve_layout(command: string)
        l:view = winsaveview()
        execute command
        winrestview(view)
    enddef

.. function:: print_option(option: str) -> None

    Pretty print an option’s value.

    :param option: Option to display

::

    def misc#print_option(value: string)
        const value = eval(value[0] ==# '&' ? value : '&' .. value)
        echo sort(split(value, ','))->join("\n")
    enddef

.. function:: scissors() -> None

    Place perforation-style lines around the given range.

::

    def misc#scissors()
        const max_len = getline(firstline, lastline)->map(
        \   {_, s -> strdisplaywidth(s)}
        \ )->max()
        const bound = &textwidth == 0 ? l:max_len : min([max_len, &textwidth])
        const perf = (bound / 2) - 1
        const marker = printf('%s%%s%s', repeat('-', perf),
                              repeat('-', perf + (perf % 2)))

        append(firstline - 1, printf(marker, '8<'))
        append(lastline + 1, printf(marker, '>8'))
    enddef

.. function:: str2chars(str: str) -> List[str]

    Convert a string to a list of characters.

    :param str: String to convert
    :returns: Individual characters from input

::

    def misc#str2chars(str: string): list<string>
        return split(str, '\zs')
    enddef

.. function:: title_word(word: str) -> str

    Convenience function to apply title case to a word.

    :param word: Text to operate on
    :returns: Title-cased input

::

    def misc#title_word(word: string): string
        return toupper(slice(word, 0, 1)) .. slice(word, 1)
    enddef

.. function:: toggle_flag(option: str, flag: str) -> None

    Toggle an option.

    :param option: Option to toggle
    :param flag: Flag to change on given option

::

    def misc#toggle_flag(option: string, flag: string)
        const optstr = eval('&' .. option)
        if stridx(optstr, ',') == -1
            # Simple char options like 'fo'
            const flip = '+-'[optstr =~# flag]
        else
            # Comma lists options like 'cot'
            const flip = '+-'[index(split(optstr, ','), flag) != -1]
        endif
        execute printf('set %s%s=%s', option, flip, flag)
    enddef

.. function:: version() -> str

    Find |vim|’s base version.

    Many distributions package |vim| with cherry picked patches, and sometimes
    it is nice to know the current base version.

    :returns: |vim| version including the maximum consecutive patch

::

    def misc#version()
        var n = 1
        while has('patch' .. n)
            n += 1
        endwhile
        return printf('%d.%d.%04d', v:version / 100, v:version % 100, n - 1)
    enddef

.. _ninja: https://ninja-build.org/
.. _make: https://www.gnu.org/software/make/make.html
