let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $XDG_CACHE_HOME . '/vim/tmp/ctrlp_cache'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_extensions = ['buffertag', 'line', 'tag', 'quickfix', 'undo']
let g:ctrlp_mruf_exclude = '/tmp/.*'
let g:ctrlp_follow_symlinks = 1

nmap <C-M-p> :CtrlP<CR>
