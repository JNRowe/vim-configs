" Vim colour file
" Name:       jnrowe.vim
" Maintainer: James Rowe <jnrowe@gmail.com>
" Homepage:   http://github.com/JNRowe/vim-configs/blob/master/colors/jnrowe.vim
"
" This theme is designed for the GUI.
"
" The colours are based around the tango palette, but this isn't really a tango
" theme.
"
" To use a darker background, :let g:jnrowe_dark = 1

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

if !exists("g:jnrowe_dark")
    let g:jnrowe_dark = 0
endif

let colors_name = "jnrowe"

" Base colours
highlight Cursor        guibg=#d3d7cf
if !g:jnrowe_dark
    highlight NonText   guibg=#555753  guifg=#babdb6
    highlight Normal    guibg=#454545  guifg=#f4f4f4
else
    highlight NonText   guibg=#353733  guifg=#babdb6
    highlight Normal    guibg=#252525  guifg=#f4f4f4
endif
highlight Visual        guibg=#555753                 gui=bold
highlight lCursor       guibg=#eeeeec

" Search
highlight IncSearch     guibg=#fce94f  guifg=#cc0000  gui=italic
if v:version >= 700
    highlight Matchparen               guifg=#8ae234  gui=bold
endif
highlight Search        guibg=#fce94f  guifg=#a40000  gui=italic

" Window stuff
highlight CursorColumn  guibg=#888a85
highlight CursorLine    guibg=#555753
highlight FoldColumn    guibg=#4a4a4a  guifg=#dedede
highlight Folded        guibg=#8090a0  guifg=#111111
highlight LineNr        guibg=#222222  guifg=#aaaaaa  gui=italic
highlight SignColumn    guibg=#2a2a2a
highlight StatusLine    guibg=#4d6884  guifg=#ffffff  gui=bold,underline
highlight StatusLineNC  guibg=#263442  guifg=#999999  gui=italic,underline
highlight VertSplit     guibg=#a0b0c0  guifg=#a0b0c0

" Command line
highlight ErrorMsg      guibg=#ef2929  guifg=#eeeeec  gui=undercurl
highlight WarningMsg                   guifg=#ef2929  gui=italic

if v:version >= 700
    " Popup menu
    highlight Pmenu     guibg=#555753  guifg=#d3d7cf
    highlight PmenuSbar guibg=#888a85  guifg=#eeeeec
    highlight PmenuSel  guibg=#73d216  guifg=#2e3436  gui=italic
endif

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

" Hooks {{{
" I realise people don't like this type of thing in colourschemes, but I don't
" care as toggling this correctly is horrendous!
if version >= 700
    function! s:InsertColour(mode)
        if a:mode == 'i'
            let bg_colour = "#73d216"
        elseif a:mode == 'r'
            let bg_colour = "#ef2929"
        else
            let bg_colour = "#f57900"
        endif
        execute("highlight StatusLine guibg=" . bg_colour . " gui=underline")
    endfunction

    augroup jnrowe_color
    autocmd!
    autocmd InsertEnter,InsertChange * call s:InsertColour(v:insertmode)
    autocmd InsertLeave *
        \ highlight StatusLine guibg=#4d6884  gui=bold,underline
    " When we leave this colourscheme(but we won't!) drop our events so they
    " don't interfere with other colourschemes
    function! s:ScrubEvents()
        if g:colors_name !=# "jnrowe" |
            autocmd! jnrowe_color
        endif
    endfunction
    autocmd ColorScheme * call s:ScrubEvents()
    augroup END
endif
" }}}

