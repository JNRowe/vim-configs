let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'
let g:UltiSnipsExpandTrigger = '<C-j>'

let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction

inoremap <silent> <Tab> <C-r>=(Ulti_ExpandOrJump_and_getRes() > 0)
    \ ? "" : VimCompletesMe#vim_completes_me(0)<CR>
