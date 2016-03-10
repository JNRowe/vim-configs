if exists("g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute("let g:loaded_xcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
