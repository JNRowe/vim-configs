" Make these scrub the old entry if they exists
map <buffer> <LocalLeader>pn
    \ mXgg/^$/<CR>iX-advice: perhaps read now<CR><Esc>`X
map <buffer> <LocalLeader>ps
    \ mXgg/^$/<CR>iX-advice: perhaps read soon<CR><Esc>`X
map <buffer> <LocalLeader>pw
    \ mXgg/^$/<CR>iX-advice: perhaps read whenever<CR><Esc>`X

map <buffer> <LocalLeader>sn mXgg/^$/<CR>iX-advice: should read now<CR><Esc>`X
map <buffer> <LocalLeader>ss
    \ mXgg/^$/<CR>iX-advice: should read soon<CR><Esc>`X
map <buffer> <LocalLeader>sw
    \ mXgg/^$/<CR>iX-advice: should read whenever<CR><Esc>`X

map <buffer> <LocalLeader>mn mXgg/^$/<CR>iX-advice: must read now<CR><Esc>`X
map <buffer> <LocalLeader>ms mXgg/^$/<CR>iX-advice: must read soon<CR><Esc>`X
map <buffer> <LocalLeader>mw
    \ mXgg/^$/<CR>iX-advice: must read whenever<CR><Esc>`X

" So called smart quotes. ‘, ’, “, ” respectively
imap <buffer> <LocalLeader>_` <C-v>u2018
imap <buffer> <LocalLeader>_' <C-v>u2019
imap <buffer> <LocalLeader>`` <C-v>u201c
imap <buffer> <LocalLeader>'' <C-v>u201d

setlocal tw=72
