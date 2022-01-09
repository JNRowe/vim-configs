``localcfg/plugins/vim_vebugger.vim``
=====================================

.. include:: ../../.includes/scriptencoding.rst

.. include:: ../../.includes/scriptversion.rst

Configure symbols::

    const g:vebugger_breakpoint_text = '⇒'
    const g:vebugger_currentline_text = '●'

Use :command:`python3` as default Python interpreter::

    const g:vebugger_path_python_lldb = 'python3'
