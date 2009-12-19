" Vim colour file
" Name:       jnrowe.vim
" Maintainer: James Rowe <jnrowe@gmail.com>
" Homepage:   http://github.com/JNRowe/vim-configs/blob/master/colors/jnrowe.vim
"
" This theme is designed for the GUI, but should work reasonably well in 88/256
" colour terminals.
"
" The colours are based around the tango palette, but this isn't really a tango
" theme.

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "jnrowe"

" Base colours
highlight Cursor        guibg=#d3d7cf
highlight NonText       guibg=#555753  guifg=#555753
highlight Normal        guibg=#454545  guifg=#f4f4f4
highlight Visual        guibg=#555753                 gui=bold
highlight lCursor       guibg=#eeeeec

" Search
highlight IncSearch     guibg=#fce94f  guifg=#cc0000  gui=italic
highlight Matchparen                   guifg=#8ae234  gui=bold
highlight Search        guibg=#fce94f  guifg=#a40000  gui=italic

" Window stuff
highlight CursorColumn  guibg=#888a85
highlight CursorLine    guibg=#555753
highlight FoldColumn    guibg=#4a4a4a  guifg=#dedede
highlight Folded        guibg=#8090a0  guifg=#111111
highlight LineNr        guibg=#222222  guifg=#aaaaaa  gui=italic
highlight Pmenu         guibg=#cb2f27  guifg=#ffffff
highlight SignColumn    guibg=#2a2a2a
highlight StatusLine    guibg=#4d6884  guifg=#ffffff  gui=bold,underline
highlight StatusLineNC  guibg=#263442  guifg=#999999  gui=italic,underline
highlight VertSplit     guibg=#a0b0c0  guifg=#a0b0c0

" Command line
highlight ErrorMsg      guibg=#ef2929  guifg=#eeeeec  gui=undercurl
highlight WarningMsg                   guifg=#ef2929  gui=italic

" Popup menu
highlight Pmenu         guibg=#555753  guifg=#d3d7cf
highlight PmenuSbar     guibg=#888a85  guifg=#eeeeec
highlight PmenuSel      guibg=#73d216  guifg=#2e3436  gui=italic

" Specials
highlight Special       guifg=#fd8900
highlight Title                        guifg=#ffffff  gui=bold
highlight Todo          guibg=#520000  guifg=#e50808  gui=bold

" Syntax
highlight Comment       guibg=#555753  guifg=#eeeeec  gui=italic
highlight Constant                     guifg=#8ae234
highlight Error         guibg=#ef2929  guifg=#eeeeec  gui=undercurl
highlight Function                     guifg=#ce5c00  gui=bold
highlight Identifier                   guifg=#729fcf  gui=bold
highlight Label                        guifg=#888a85
highlight Number                       guifg=#d3d7cf  gui=bold
highlight PreProc                      guifg=#edd400  gui=bold
highlight Statement                    guifg=#f57900  gui=bold
highlight String                       guifg=#edd400
highlight Type                         guifg=#73d216
highlight Warning                      guifg=#ef2929  gui=italic

