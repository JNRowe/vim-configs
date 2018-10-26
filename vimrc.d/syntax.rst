``vimrc.d/syntax.vim``
======================

Syntax files settings

.. code-block:: vim

    let g:erlang_highlight_special_atoms = v:true

.. code-block:: vim

    let g:ft_man_folding_enable = v:true
    let g:ft_man_open_mode = 'vert'

Default to bash for sh syntax, and posix is a more realistic default for me if
``g:is_bash`` is toggled

.. code-block:: vim

    let g:is_bash = v:true
    let g:is_posix = v:true

Default to ``groff``

.. code-block:: vim

    let g:nroff_is_groff = v:true

Highlight everything possible for python

.. code-block:: vim

    let g:python_highlight_all = v:true

.. code-block:: vim

    let g:rust_conceal = v:true
    let g:rust_conceal_mod_path = v:true
    let g:rust_conceal_pub = v:true
    let g:rust_fold = 2

Fold as much as possible, and disable things caught by linter

.. code-block:: vim

    let g:sh_fold_enabled = 7
    let g:sh_minlines = 400
    let g:sh_no_error = v:true

lua/Python/ruby only embedded syntax

.. code-block:: vim

    let g:vimsyn_embed = 'lPr'

.. code-block:: vim

    let g:xml_syntax_folding = v:true

.. code-block:: vim

    let g:zsh_fold_enable = v:true

Don't reload colourscheme on second source

.. code-block:: vim

    if !exists('g:colors_name')
        colorscheme jnrowe
    endif
