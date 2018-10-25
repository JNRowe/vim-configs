``localcfg/plugin_vim_vebugger.vim``
====================================

.. code-block:: vim

    nnoremap [vebugger] <Nop>
    nmap <LocalLeader>v [vebugger]

    let g:vebugger_leader='[vebugger]'

.. code-block:: vim

    let g:vebugger_breakpoint_text = '⇒'
    let g:vebugger_currentline_text = '●'
