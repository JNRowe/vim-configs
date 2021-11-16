``autoload/plugins/vim_editqf.vim``
===================================

.. function:: set_data_files() -> None

    Configure location for stored ``quickfix`` files.

::

    function! plugins#vim_editqf#set_data_files() abort
        let l:template = g:vim_data_dir . '/%s/' .
        \   expand('%:p:~:gs?/?_?:gs?%?%%?') . '.dat'
        let g:editqf_saveqf_filename = printf(l:template, 'quickfix')
        let g:editqf_saveloc_filename = printf(l:template, 'location')
    endfunction
