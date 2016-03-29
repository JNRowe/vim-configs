if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

" Better judgement aside as it isn't packaged anywhere for me.  Should that
" change…
"let g:EditorConfig_core_mode = "external_command"
let g:EditorConfig_python_files_dir = g:dein_repos_dir .
    \ "/github.com/editorconfig/editorconfig-vim/plugin/editorconfig-core-py/"

let g:EditorConfig_max_line_indicator = "none"
