nnoremap <LocalLeader># :GundoToggle<CR>

let g:gundo_help = v:false
let g:gundo_width = 30
let g:gundo_preview_bottom = v:true
if has('python3')
    let g:gundo_prefer_python3 = v:true
endif
