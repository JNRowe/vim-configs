``autoload/plugins/regex.vim``
==============================

.. include:: ../../.includes/scriptversion.rst

.. function:: lang_complete(arglead: str, cmdline: str, cursorpos: int) -> List[str]

    Completion targets for usable ``:Regex`` modes.

    :param arglead: Text of argument being completed
    :param cmdline: Text of the command line
    :param cursorpos: Location within command line
    :returns: Completion candidates

::

    function! plugins#regex#lang_complete(arglead, cmdline, cursorpos) abort
        const l:lang_files = glob(
        \   g:dein_repos_dir ..
        \   '/github.com/ervandew/regex/autoload/regex/lang/*.vim',
        \   v:false, v:true
        \ )
        const l:supported_langs = filter(
        \   mapnew(l:lang_files, {_, s -> fnamemodify(s, ':t:r')}),
        \   {_, s -> !empty(exepath(s))}
        \ )
        return sort(filter(l:supported_langs,
        \                  {_, s -> s =~? '^' .. a:arglead}))
    endfunction
