let g:session_dir = '~/.vim/view/'

let g:gsession_non_default_mapping = 1
nnoremap <leader>ss    :GSessionMakeLocal<CR>
nnoremap <leader>sS    :GSessionMake<CR>

nnoremap <leader>sn    :NamedSessionMakeCwd<CR>
nnoremap <leader>sN    :NamedSessionMake<CR>

nnoremap <leader>sl    :NamedSessionLoadCwd<CR>
nnoremap <leader>sL    :NamedSessionLoad<CR>

nnoremap <leader>se    :GSessionEliminateCurrent<CR>
nnoremap <leader>sE    :GSessionEliminateAll<CR>

nnoremap <leader>sp    :GSessionListLocal<CR>
