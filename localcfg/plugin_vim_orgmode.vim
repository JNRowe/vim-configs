if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

" I'm clearly *so* vim at this point that jump to insert mode tends to irk me
let g:org_prefer_insert_mode = 0

let g:org_todo_keywords = [
    \ "TODO(t)", "NEXT(n)", "STARTED(s)",
    \ "|",
    \ "DONE(d)", "CANCELLED(c)", "REJECTED(r)"
\]
