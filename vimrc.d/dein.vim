set runtimepath+=~/.vim/external/dein.vim/

let g:dein_state_dir = g:vim_cache_dir . '/dein'
let g:dein_repos_dir = g:dein_state_dir . '/repos'

if executable('notify-send') && exists('$DISPLAY')
    let g:dein#enable_notification = v:true
    let g:dein#notification_icon = '~/.vim/icons/editor.svg'
endif

if dein#load_state(g:dein_state_dir)
    call dein#begin(g:dein_state_dir, ['~/.vim/vimrc', '~/.vim/dein.vim', expand('<sfile>')])

    source ~/.vim/dein.vim

    call dein#end()
    call dein#save_state()
endif

call dein#call_hook('source')
call dein#call_hook('post_source')
if has('vim_starting')
    if dein#check_install()
        echo 'Missing plugins'
    endif
endif
filetype plugin indent on
syntax enable
