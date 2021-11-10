``vimrc.d/syntax.vim``
======================

Load a colour scheme, but only on first source::

    if !exists('g:colors_name')
        colorscheme jnrowe
    endif

Only enable Lua_/|Python|/Ruby_ embedded syntax regardless of built-in support::

    let g:vimsyn_embed = 'lPr'

Manual pages
------------

Support folding::

    let g:ft_man_folding_enable = v:true

Prefer vertical splits::

    let g:ft_man_open_mode = 'vert'

Python
------

Highlight everything possible for |Python|::

    let g:python_highlight_all = v:true

reStructuredText
----------------

Disable |reST|’s default indentation rules::

    let g:rst_style = v:false

.. note::

    The indentation rules *mostly* work, but occasionally don’t seem to do
    the right thing… and that is *far* more annoying than always being wrong.

Rust
----

Use fancy conceal support for rust_::

    let g:rust_conceal = v:true
    let g:rust_conceal_mod_path = v:true
    let g:rust_conceal_pub = v:true

.. todo:: Add screenshot.

Enable folding support, but default to the global ``'foldlevel'``::

    let g:rust_fold = 1

Shell scripts
-------------

Default to bash_ for ``sh`` syntax, and POSIX_ is a more realistic default for
me if ``g:is_bash`` is toggled::

    let g:is_bash = v:true
    let g:is_posix = v:true

Fold shell scripts as much as possible::

    let g:sh_fold_enabled = 7

… and search a long way to keep syntax highlighting correct::

    let g:sh_minlines = 400

… and disable highlighting errors that will be caught by :ref:`linter
<ale-plugin>`::

    let g:sh_no_error = v:true

XML
---

Support folding in :abbr:`XML (eXtensible Markup Language)`::

    let g:xml_syntax_folding = v:true

zsh
---

Support folding for |zsh| too, including the excellent alternative syntax::

    let g:zsh_fold_enable = v:true

.. todo: Link to zsh’s alternative syntax

.. _Lua: http://www.lua.org/
.. _Ruby: https://www.ruby-lang.org/
.. _rust: https://www.rust-lang.org/
.. _bash: http://tiswww.case.edu/php/chet/bash/bashtop.html
.. _POSIX:
    http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html
