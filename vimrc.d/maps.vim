if SLoaded(expand('<sfile>'))
    finish
endif

" Quickly move between buffers {{{
map <M-Left> :bprev<CR>
map <M-Right> :bnext<CR>
" }}}

" Navigate tags with keys I find less annoying {{{
map <C-S-Left> <C-T>
map <C-S-Right> <C-]>
" }}}

" Ctrl + up/down to skip paragraphs {{{
nnoremap <C-Up> {
nnoremap <C-Down> }
" }}}

" Remove nasty page skipping mappings {{{
inoremap <S-Up> <C-o>gk
inoremap <S-Down> <C-o>gj
noremap <S-Up> gk
noremap <S-Down> gj
" }}}

" Make C-g verbose by default
nnoremap <C-g> 2<C-g>

" Map Q to reformat paragraphs
nmap Q gqap

" Wrap current word in brackets {{{
nmap ,( mpwbi(<Esc>ea)<Esc>`pl
nmap ,[ mpwbi[<Esc>ea]<Esc>`pl
nmap ,{ mpwbi{<Esc>ea}<Esc>`pl
" }}}

" Shift + left/right to select text {{{
nnoremap <S-Left> vh
nnoremap <S-Right> vl
nnoremap <S-Up> Vk
nnoremap <S-Down> Vj
" }}}

" Logical Y mapping, like D
map Y y$

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
inoremap <silent> <home> <C-o>:call <SID>HomeSkip()<CR>
nnoremap <silent> <home> :call <SID>HomeSkip()<CR>
function! s:HomeSkip()
    if col('.') != 1
        normal 0
    else
        normal ^
    endif
endfunction

" Function keys {{{
if has('extra_search')
    nmap <silent> <F1> :set hlsearch!<CR>
endif
nnoremap <silent> <F2> :set list!<CR>
nmap <silent> <F3> :set expandtab!<CR>
" F4 toggles paste
" <[SC]-F4> toggles menu/toolbar in gvim
" F5 is VimFiler
nmap <F10> :make check<CR>
nmap <S-F10> :execute 'make -C ' . expand('%:p:h') . ' check'<CR>
nmap <F11> :make<CR>
nmap <S-F11> :execute 'make -C ' . expand('%:p:h')<CR>
nmap <silent> <C-F11> :let @/ = ''<CR>

" Window management {{{
nmap <C-w><Bar> <C-w>v
nmap <C-w>- <C-w>s
nmap <Tab> <C-w>p
if has('quickfix')
    nmap <S-Tab> <C-w>P
endif
" }}}

" Folding support maps {{{
" The following mappings may not be to your liking, but I never use +/- for
" line movement.
if has('folding')
    nmap - zc
    nmap + zo

    vmap - zf
endif
" }}}

" From godlygeek's vimrc {{{
"
" Insert a modeline on the last line with <Leader>ml
nmap <silent> <Leader>ml :call <SID>ModelineStub()<CR>

function! s:ModelineStub()
    let s:save_cursor = getpos('.')
    let s:fmt = ' vim: set ft=%s ts=%d sw=%d tw=%d %s:'

    let s:x = printf(&commentstring,
        \            printf(s:fmt, &filetype, &tabstop, &shiftwidth,
        \                   &textwidth, (&expandtab ? 'et' : 'noet')))
    $put =substitute(substitute(s:x, '\ \+', ' ', 'g'), ' $', '', '')
    call setpos('.', s:save_cursor)
endfunction
" }}}

" Close the help window, wherever that may be {{{
function! s:Close_Help()
    for l:w in range(1, winnr('$'))
        let l:b = winbufnr(l:w)
        if getbufvar(l:b, '&buftype') ==# 'help'
            execute l:w . 'wincmd c'
            break
        endif
    endfor
endfunction
nmap <silent> <Leader>? :call <SID>Close_Help()<CR>
" }}}

nnoremap [Help] <Nop>
nmap <Leader>h [Help]

for s:t in ['pattern', 'quickref', 'registers']
    execute 'nmap [Help]' . s:t[0] . ' :help ' . s:t . '<CR>'
endfor

" vim: fdm=marker:
