``localcfg/plugin_undotree.vim``
================================

.. include:: ../.includes/scriptencoding.rst

Make diff output more readable::

    let g:undotree_DiffCommand = 'diff -pud --label earlier --label later'

Configure look::

    let g:undotree_HelpLine = v:false
    let g:undotree_SetFocusWhenToggle = v:true
    let g:undotree_ShortIndicators = v:true
    let g:undotree_TreeNodeShape = '•'
    let g:undotree_WindowLayout = 4
