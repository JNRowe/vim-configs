``localcfg/plugin_vim_vebugger.vim``
====================================

.. _vim-vebugger-custom-maps:

Use my custom maps::

    call MnemonicMap('vebugger', {'local': v:true})
    let g:vebugger_leader='[vebugger]'

Configure symbols::

    let g:vebugger_breakpoint_text = '⇒'
    let g:vebugger_currentline_text = '●'
