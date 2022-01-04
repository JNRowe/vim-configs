``vimrc.d/syntax.vim``
======================

.. include:: ../.includes/scriptversion.rst

Load a colour scheme, but only on first source::

    if !exists('g:colors_name')
        colorscheme molokai
    endif

Only enable Lua_/|Python|/Ruby_ embedded syntax regardless of built-in support::

    const g:vimsyn_embed = 'lPr'

Manual pages
------------

Support folding::

    const g:ft_man_folding_enable = v:true

Prefer vertical splits::

    const g:ft_man_open_mode = 'vert'

Python
------

Highlight everything possible for |Python|::

    const g:python_highlight_all = v:true

reStructuredText
----------------

Disable |reST|’s default indentation rules::

    const g:rst_style = v:false

.. note::

    The indentation rules *mostly* work, but occasionally don’t seem to do
    the right thing… and that is *far* more annoying than always being wrong.

The folding configuration for |reST| files is quite poor, and the custom
``'foldtext'`` makes using folds close to useless::

    const g:rst_fold_enabled = v:false

.. note::

    This isn’t enabled upstream, but has been toggled on in a few site files for
    reasons which are far beyond me.

Enable common — to me — highlighting support::

    let g:rst_syntax_code_list = #{
    \   c: ['c', ],
    \   cpp: ['cpp', 'c++'],
    \   lisp: ['emacs', 'lisp'],
    \   python: ['python', ],
    \   sh: ['sh', 'zsh'],
    \   vim: ['vim', ],
    \ }

.. image:: /.static/rst_code_block.png
   :alt: Example of code block highlighting

.. todo::

    This should probably be configured more locally as it includes the full
    syntax definitions for each language, and it considerably increase syntax
    parsing speed.  The actual impact needs measuring properly first!

Rust
----

Use fancy conceal support for rust_::

    const g:rust_conceal = v:true
    const g:rust_conceal_mod_path = v:true
    const g:rust_conceal_pub = v:true

.. todo:: Add screenshot.

Enable folding support, but default to the global ``'foldlevel'``::

    const g:rust_fold = 1

Shell scripts
-------------

Default to bash_ for ``sh`` syntax, and POSIX_ is a more realistic default for
me if ``g:is_bash`` is toggled::

    const g:is_bash = v:true
    const g:is_posix = v:true

Fold shell scripts as much as possible::

    const g:sh_fold_enabled = 7

… and search a long way to keep syntax highlighting correct::

    const g:sh_minlines = 400

… and disable highlighting errors that will be caught by :ref:`linter
<ale-plugin>`::

    const g:sh_no_error = v:true

XML
---

Support folding in :abbr:`XML (eXtensible Markup Language)`::

    const g:xml_syntax_folding = v:true

zsh
---

Support folding for |zsh| too, including the excellent `alternative syntax`_::

    const g:zsh_fold_enable = v:true

.. _Lua: http://www.lua.org/
.. _Ruby: https://www.ruby-lang.org/
.. _rust: https://www.rust-lang.org/
.. _bash: http://tiswww.case.edu/php/chet/bash/bashtop.html
.. _POSIX:
    http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html
.. _alternative syntax:
    http://zsh.sourceforge.net/Doc/Release/Shell-Grammar.html#Alternate-Forms-For-Complex-Commands
