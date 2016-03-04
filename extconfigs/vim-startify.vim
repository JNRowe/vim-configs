" These commonly edited config files are reasonable bookmarks for when I've
" started vim without args, but perhaps others are more useful when started with
" args?
let g:startify_bookmarks = [
    \ g:xdg_config_dir . "/awesome/rc.moon",
    \ g:xdg_config_dir . "/awesome/themes/jnrowe/theme.moon",
    \ filereadable(g:xdg_config_dir . "/git/config") ? g:xdg_config_dir . "/git/config" : "~/.gitconfig",
    \ '~/.vim/vimrc',
    \ '~/.vim/vimrc-local',
    \ '~/.vim/neobundle.vim',
\ ]
let g:startify_enable_special = 0
let g:startify_session_dir = g:vim_data_dir . '/sessions'

nnoremap <S-F1> :Startify<cr>
