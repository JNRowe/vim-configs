scriptencoding utf-8

if &compatible
    set nocompatible
endif

if v:version < 704
    let v:warningmsg = "Vim version 7.4 or higher is required for some of "
        \ "the functionality in this vimrc"
    echohl WarningMsg
    echomsg v:warningmsg
    echohl none
endif

" Pull in local settings.  This is only for locally required settings while
" reading this file.
if filereadable(fnamemodify("~/.vim/vimrc.pre", ':p'))
    source ~/.vim/vimrc.pre
endif

runtime vimrc.d/paths.vim  " *Must* remain first

runtime vimrc.d/dein.vim
runtime vimrc.d/settings.vim
runtime vimrc.d/syntax.vim
runtime vimrc.d/maps.vim
runtime vimrc.d/lib.vim
runtime vimrc.d/misc.vim
runtime vimrc.d/localcfg.vim
