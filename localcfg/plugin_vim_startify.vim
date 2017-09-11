" These commonly edited config files are reasonable bookmarks for when I've
" started vim without args, but perhaps others are more useful when started with
" args?
let g:startify_bookmarks = [
    \ g:xdg_config_dir . "/awesome/rc.moon",
    \ g:xdg_config_dir . "/awesome/themes/jnrowe/theme.moon",
    \ filereadable(g:xdg_config_dir . "/git/config") ? g:xdg_config_dir . "/git/config" : "~/.gitconfig",
    \ '~/.vim/vimrc',
    \ '~/.vim/vimrc-local',
    \ '~/.vim/dein.vim',
\ ]
let g:startify_commands = [
    \ ['Version', ':version'],
    \ ['Reference', ':help reference'],
    \ ['FAQ', ':help Vim-FAQ'],
\ ]
let g:startify_enable_special = v:false
let g:startify_fortune_use_unicode = v:true
" Requires Font Awesome in places
" Note: I have FA resolve locally as webfonts are disabled in my browsers,
" if you don't have a similar setup then the following won't work.
let g:startify_list_order = [
    \ [''], 'files',
    \ [''], 'dir',
    \ [''], 'sessions',
    \ [''], 'commands',
    \ [''], 'bookmarks',
\ ]
let g:startify_relative_path = v:true
let g:startify_session_autoload = v:true
let g:startify_session_dir = g:vim_data_dir . '/sessions'
let g:startify_session_sort = v:true

nnoremap <S-F1> :Startify<CR>
