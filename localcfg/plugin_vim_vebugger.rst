``localcfg/plugin_vim_vebugger.vim``
====================================

.. _vim-vebugger-custom-maps:

Use my custom maps::

    call misc#MnemonicMap('vebugger', {'local': v:true})
    let g:vebugger_leader='[vebugger]'

Configure symbols::

    let g:vebugger_breakpoint_text = '⇒'
    let g:vebugger_currentline_text = '●'

Use :command:`python3` as default Python::

    let g:vebugger_path_python_lldb = 'python3'
