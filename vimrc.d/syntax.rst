``vimrc.d/syntax.vim``
======================

More highlighting for Erlang_::

    let g:erlang_highlight_special_atoms = v:true

Support folding in manpages::

    let g:ft_man_folding_enable = v:true

Prefer vertical splits for manpages::

    let g:ft_man_open_mode = 'vert'


Default to bash_ for ``sh`` syntax, and POSIX_ is a more realistic default for
me if ``g:is_bash`` is toggled::

    let g:is_bash = v:true
    let g:is_posix = v:true

Default to groff_::

    let g:nroff_is_groff = v:true

Highlight everything possible for Python_::

    let g:python_highlight_all = v:true

Use fancy conceal support for rust_::

    let g:rust_conceal = v:true
    let g:rust_conceal_mod_path = v:true
    let g:rust_conceal_pub = v:true

Enable folding support, but default to the global ``'foldlevel'``::

    let g:rust_fold = 1

Fold shell scripts as much as possible::

    let g:sh_fold_enabled = 7

… and search a long way to keep syntax highlighting correct::

    let g:sh_minlines = 400

… and disable highlighting errors that will be caught by :ref:`linter
<ale-plugin>`::

    let g:sh_no_error = v:true

lua_/Python_/ruby_ only embedded syntax::

    let g:vimsyn_embed = 'lPr'

Support folding in :abbr:`XML (eXtensible Markup Language)`::

    let g:xml_syntax_folding = v:true

Support folding for zsh_ too, including the excellent alternative syntax::

    let g:zsh_fold_enable = v:true

Load a colour scheme, but only on first source::

    if !exists('g:colors_name')
        colorscheme jnrowe
    endif

.. _erlang: https://www.erlang.org/
.. _bash: http://tiswww.case.edu/php/chet/bash/bashtop.html
.. _POSIX: http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html
.. _groff: https://www.gnu.org/software/groff/groff.html
.. _Python: https://www.python.org/
.. _reST: http://docutils.sourceforge.net/rst.html
.. _rust: https://www.rust-lang.org/
.. _lua: http://www.lua.org/
.. _ruby: https://www.ruby-lang.org/
.. _zsh: https://www.zsh.org/
