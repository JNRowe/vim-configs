``localcfg/plugin_vim_vebugger.vim``
====================================

.. include:: ../.includes/scriptencoding.rst

Configure symbols::

    let g:vebugger_breakpoint_text = '⇒'
    let g:vebugger_currentline_text = '●'

Use :command:`python3` as default Python interpreter::

    let g:vebugger_path_python_lldb = 'python3'
