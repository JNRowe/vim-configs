``vimrc.d/packages.vim``
========================

Enable ``:Cfilter`` for using enormously noisy compilers::

    packadd! cfilter

When using server mode ``editexisting`` makes using currently open files far
simpler::

    packadd! editexisting

Useful justification options::

    command! -range -nargs=* Justify packadd justify |
    \   <line1>,<line2>Justify <args>
