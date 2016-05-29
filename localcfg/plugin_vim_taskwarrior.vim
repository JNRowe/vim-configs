if SLoaded(expand('<sfile>'))
    finish
endif
if !executable('task')
    finish
endif

let g:task_default_prompt = ['project', 'description', 'estimate']

nnoremap <silent> [unite]q :<C-U>Unite -buffer-name=taskwarrior/history
    \ taskwarrior/history<CR>
