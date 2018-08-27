scriptencoding utf-8

if &compatible
    set nocompatible
endif

if v:version < 800
    let v:warningmsg = 'Vim version 8 or higher is required'
    " ^^ but, pull requests that aren't too invasive are welcome
    echohl WarningMsg
    echomsg v:warningmsg
    echohl none
endif
if has('nvim')
    let v:errmsg = 'This config will *NOT* work with nvim'
    " ^^ but, pull requests that don't break Vim are welcome
    echohl ErrorMsg
    echoerr v:errmsg
    echohl none
    cquit
endif

" Pull in local settings.  This is only for locally required settings while
" reading this file.
if filereadable(fnamemodify('~/.vim/vimrc.pre', ':p'))
    source ~/.vim/vimrc.pre
endif

runtime vimrc.d/paths.vim  " *Must* be early

runtime vimrc.d/disabled.vim
runtime vimrc.d/dein.vim
runtime vimrc.d/settings.vim
runtime vimrc.d/syntax.vim
runtime vimrc.d/maps.vim
runtime vimrc.d/misc.vim
if has('patch-7.4.1821')
    runtime vimrc.d/packages.vim
else
    " There may be other things in packages.vim, but this is *the* thing I can't
    " do without.
    if !exists('*EditExisting')
        runtime macros/editexisting.vim
    endif
endif
runtime vimrc.d/localcfg.vim
