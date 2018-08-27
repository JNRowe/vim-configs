" Quickly move between buffers {{{
noremap <M-Left> :bprev<CR>
noremap <M-Right> :bnext<CR>
" }}}

" I hate you *so* much Right now {{{
" I’ll add that this isn’t about hjkl, I’m truly not interested in that
" argument.  This is entirely about forcing me to use text objects more often.
if exists('$VIM_DISABLE_CURSORS')
    nnoremap <Up> <nop>
    inoremap <Up> <nop>

    nnoremap <down> <nop>
    inoremap <down> <nop>

    nnoremap <Left> <nop>
    nnoremap <Right> <nop>
    inoremap <Left> <nop>
    inoremap <Right> <nop>
endif
" }}}

" Navigate tags with keys I find less annoying {{{
noremap <C-S-Left> <C-T>
noremap <C-S-Right> <C-]>
" }}}

" Ctrl + up/down to skip paragraphs {{{
nnoremap <C-Up> {
nnoremap <C-Down> }
" }}}

" Remove nasty page skipping mappings {{{
inoremap <S-Up> <C-o>gk
inoremap <S-Down> <C-o>gj
nnoremap <S-Up> gk
nnoremap <S-Down> gj
" }}}

" Make C-g verbose by default
nnoremap <C-g> 2<C-g>

" Map Q to reformat paragraphs
nnoremap Q gqap

" Shift + left/right to select text {{{
nnoremap <S-Left> vh
nnoremap <S-Right> vl
nnoremap <S-Up> Vk
nnoremap <S-Down> Vj
" }}}

" Logical Y mapping, like D
nnoremap Y y$

" Insert literal tab, for that once a year when it makes sense
inoremap <silent> <S-Tab> <C-v><Tab>

" Re-grab selection after {de,in}dent for simpler repeating {{{
vnoremap < <gv
vnoremap > >gv

" Visual mode indent that matches how it *feels* in insert
vnoremap <Tab> >gv
vnoremap <Backspace> <gv
" }}}

" <home> darts between start of line and start of text
inoremap <silent> <home> <C-o>:call <SID>home_skip()<CR>
nnoremap <silent> <home> :call <SID>home_skip()<CR>
function! s:home_skip()
    if col('.') != 1
        normal! 0
    else
        normal! ^
    endif
endfunction

" Function keys {{{
nnoremap <silent> <F3> :set expandtab!<CR>
" F4 toggles paste
" <[SC]-F4> toggles menu/toolbar in gvim
nnoremap <F10> :make check<CR>
nnoremap <S-F10> :execute 'make -C ' . expand('%:p:h') . ' check'<CR>
nnoremap <F11> :make<CR>
nnoremap <S-F11> :execute 'make -C ' . expand('%:p:h')<CR>
nnoremap <silent> <C-F11> :let @/ = ''<CR>

" Window management {{{
nnoremap <C-w><Bar> <C-w>v
nnoremap <C-w>- <C-w>s
nnoremap <Tab> <C-w>p
if has('quickfix')
    nnoremap <S-Tab> <C-w>P
endif
" }}}

" Folding support maps {{{
" The following mappings may not be to your liking, but I never use +/- for
" line movement.
if has('folding')
    nnoremap - zc
    nnoremap + zo

    vnoremap - zf
endif
" }}}

" From godlygeek's vimrc {{{
"
" Insert a modeline on the last line with <Leader>ml
nnoremap <silent> <Leader>ml :call <SID>modeline_stub()<CR>

function! s:modeline_stub()
    let s:save_cursor = getcurpos()
    let s:fmt = ' vim: set ft=%s ts=%d sw=%d tw=%d %s:'

    let s:x = printf(&commentstring,
        \            printf(s:fmt, &filetype, &tabstop, &shiftwidth,
        \                   &textwidth, (&expandtab ? 'et' : 'noet')))
    $put =substitute(substitute(s:x, '\ \+', ' ', 'g'), ' $', '', '')
    call setpos('.', s:save_cursor)
endfunction
" }}}

" Help related maps {{{
nnoremap [Help] <Nop>
nmap <Leader>? [Help]

for s:t in ['pattern', 'quickref', 'registers']
    execute 'nnoremap [Help]' . s:t[0] . ' :help ' . s:t . '<CR>'
endfor

" Close the help window, wherever that may be {{{
function! s:close_help()
    for l:w in range(1, winnr('$'))
        let l:b = winbufnr(l:w)
        if getbufvar(l:b, '&buftype') ==# 'help'
            execute l:w . 'wincmd c'
            break
        endif
    endfor
endfunction
nnoremap <silent> [Help]c :call <SID>close_help()<CR>
" }}}

" }}}

" Perform word-ish searches in a new window, so we can maintain position in the
" current window
for s:k in ['*', '#']
    execute 'nnoremap <C-w>' . s:k  . ' <C-w>s' . s:k
    execute 'nnoremap <C-w>g' . s:k  . ' <C-w>sg' . s:k
endfor

cnoremap <C-h> help<Space>  " I don't use vi movement keys in command-line mode
cnoremap <C-S-h> vert help<Space>

" vim: fdm=marker:
