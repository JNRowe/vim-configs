``localcfg/plugin_vim_editqf.vim``
==================================

Store data in |XDG basedir| compliant location::

    let s:base = g:vim_data_dir . '/%s/' .
    \   expand('%:p:~:gs?/?_?:gs?%?%%?') . '.dat'
    function! s:set_data_files() abort
        let g:editqf_saveqf_filename = printf(s:base, 'quickfix')
        let g:editqf_saveloc_filename = printf(s:base, 'location')
    endfunction

    augroup jnrowe_editqf
        autocmd!
        autocmd BufEnter * call <SID>set_data_files()
    augroup END
