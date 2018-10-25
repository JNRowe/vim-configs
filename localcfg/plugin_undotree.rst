``localcfg/plugin_undotree.vim``
================================

Don’t be afraid to use Unicode.

.. code-block:: vim

    scriptencoding utf-8

.. code-block:: vim

    let g:undotree_DiffCommand = 'diff -pud --label earlier --label later'
    let g:undotree_HelpLine = v:false
    let g:undotree_SetFocusWhenToggle = v:true
    let g:undotree_ShortIndicators = v:true
    let g:undotree_TreeNodeShape = '•'
    let g:undotree_WindowLayout = 4
