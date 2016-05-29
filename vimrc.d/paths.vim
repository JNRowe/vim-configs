if SLoaded(expand('<sfile>'))
    finish
endif

" Find appropriate directory for data files {{{
let g:xdg_cache_dir = expand(empty($XDG_CACHE_HOME)
    \                        ? '~/.cache' : '$XDG_CACHE_HOME')
let g:xdg_config_dir = expand(empty($XDG_CONFIG_HOME)
    \                         ? '~/.config' : '$XDG_CONFIG_HOME')
let g:xdg_data_dir = expand(empty($XDG_DATA_HOME)
    \                       ? '~/.local/share' : '$XDG_DATA_HOME')

" Vim specific paths
for s:name in ['cache', 'config', 'data']
    execute 'let g:vim_' . s:name . '_dir = g:xdg_' . s:name . "_dir . '/vim'"
    if !isdirectory(get(g:, 'vim_' . s:name . '_dir'))
        call mkdir(get(g:, 'vim_' . s:name . '_dir'), 'p')
    endif
endfor
" }}}

" vim: fdm=marker:
