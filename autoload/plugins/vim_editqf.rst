``autoload/plugins/vim_editqf.vim``
===================================

.. include:: ../../.includes/scriptversion.rst

.. function:: set_data_files() -> None

    Configure location for stored ``quickfix`` files.

::

    function! plugins#vim_editqf#set_data_files() abort
        let l:template = printf('%s/%%s/%s.dat', g:vim_data_dir,
        \                       expand('%:p:~:gs?/?_?:gs?%?%%?'))
        let g:editqf_saveqf_filename = printf(l:template, 'quickfix')
        let g:editqf_saveloc_filename = printf(l:template, 'location')
    endfunction
