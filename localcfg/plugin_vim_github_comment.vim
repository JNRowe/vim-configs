if SLoaded(expand('<sfile>'))
    finish
endif

if exists('$DISPLAY')
    let g:github_comment_open_browser = 1
endif
