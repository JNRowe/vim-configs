if exists("g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

" Better judgement aside as it isn't packaged anywhere for me.  Should that
" change…
"let g:EditorConfig_core_mode = "external_command"
let g:EditorConfig_python_files_dir=expand("~/.vim/external/editorconfig-vim/plugin/editorconfig-core-py/")

let g:EditorConfig_max_line_indicator = "none"
