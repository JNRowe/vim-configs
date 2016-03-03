" These commonly edited config files are reasonable bookmarks for when I've
" started vim without args, but perhaps others are more useful when started with
" args?
let g:startify_bookmarks = [
    \ expand("$XDG_CONFIG_HOME/awesome/rc.lua"),
    \ expand("$XDG_CONFIG_HOME/awesome/theme.lua"),
    \ expand("$XDG_CONFIG_HOME/git/config"),
    \ '~/.vim/vimrc',
    \ '~/.vim/vimrc-local',
    \ '~/.vim/neobundle.vim',
\ ]
let g:startify_enable_special = 0
let g:startify_session_dir = g:xdg_data_dir . '/sessions'

nnoremap <S-F1> :Startify<cr>
