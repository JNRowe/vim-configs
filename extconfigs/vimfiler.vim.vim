if exists("g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_extconfigs_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
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
