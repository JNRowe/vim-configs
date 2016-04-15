if SLoaded(expand("<sfile>"))
    finish
endif

" Find appropriate directory for data files {{{
let g:xdg_cache_dir = expand(empty($XDG_CACHE_HOME)
    \                        ? '~/.cache' : '$XDG_CACHE_HOME')
let g:xdg_config_dir = expand(empty($XDG_CONFIG_HOME)
    \                         ? '~/.config' : '$XDG_CONFIG_HOME')
let g:xdg_data_dir = expand(empty($XDG_DATA_HOME)
    \                       ? '~/.local/share' : '$XDG_DATA_HOME')

let g:vim_cache_dir = g:xdg_cache_dir . "/vim"
let g:vim_config_dir = g:xdg_config_dir . "/vim"
let g:vim_data_dir = g:xdg_data_dir . "/vim"
" }}}

" vim: fdm=marker:
