if exists("g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

" These settings are incredibly dependent on the colour schemes being used
if has("gui_running")
    let g:indent_guides_color_change_percent = 7
else
    let g:indent_guides_auto_colors = 0
    if &t_Co >= 88
        hi IndentGuidesOdd  ctermbg=236
        hi IndentGuidesEven ctermbg=240
    else
        hi IndentGuidesOdd  ctermbg=0
        hi IndentGuidesEven ctermbg=8
    endif
endif
let g:indent_guides_enable_on_vim_startup = 1
