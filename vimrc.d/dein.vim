if exists("g:loaded_rcd_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_rcd_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

set runtimepath^=~/.vim/external/dein.vim/

let g:dein_state_dir = g:vim_cache_dir . '/dein'
let g:dein_repos_dir = g:dein_state_dir . '/repos'

if executable('notify-send') && $DISPLAY != ""
    let g:dein#enable_notification = 1
    let g:dein#notification_icon = "~/.vim/icons/editor.png"
endif

" Disable netrw, as it clashes with plugins
let g:loaded_netrwPlugin = 1

if dein#load_state(g:dein_state_dir)
    call dein#begin(g:dein_state_dir, ['~/.vim/vimrc', '~/.vim/dein.vim'])

    source ~/.vim/dein.vim

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    echo "Missing plugins"
endif
