scriptencoding utf-8

nnoremap <buffer> [advice] <Nop>
nmap <buffer> <LocalLeader>a [advice]

for s:prio in ['perhaps', 'should', 'must']
    for s:due in ['now', 'soon', 'whenever']
        execute 'nnoremap <buffer> <silent> [advice]' . s:prio[0] . s:due[0] .
            \ ' mxgg/^$/<CR>iX-advice: ' . s:prio . ' read ' . s:due .
            \ '<CR><Esc>`x'
    endfor
endfor

setlocal complete+=s
setlocal formatoptions+=2a
if executable('par-format')
    setlocal formatprg=par-format\ -w72eq
elseif executable('par')
    setlocal formatprg=par\ -w72eq
endif
setlocal textwidth=72
