if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif
if !executable('task')
    finish
endif

let g:task_default_prompt = ['project', 'description', 'estimate']

nnoremap <silent> [unite]q :<C-U>Unite -buffer-name=taskwarrior/history
    \ taskwarrior/history<CR>
