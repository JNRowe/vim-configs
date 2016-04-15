if SLoaded(expand("<sfile>"))
    finish
endif

" Requires Font Awesome in places
" Note: I have FA resolve locally as webfonts are disabled in my browsers,
" if you don't have a similar setup then the following won't work.
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_data_directory = g:vim_cache_dir . "/vimfiler"
let g:vimfiler_force_overwrite_statusline = 0
let g:vimfiler_marked_file_icon = ""
let g:vimfiler_readonly_file_icon = ""
let g:vimfiler_time_format = "%FT%T"
let g:vimfiler_tree_closed_icon = ''
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = ''

nmap <F5> :VimFilerExplorer<CR>
nmap <S-F5> :VimFiler<CR>
nmap <C-F5> :VimFilerDouble<CR>
