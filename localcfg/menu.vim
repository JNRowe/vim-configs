function! DefineMenu(heading, items)
    " heading: menu title
    " items:
    "    str -> base item
    "    [str] -> potential fn
    "    {str: str} -> submenu with fn
    "    {str: [str]} -> submenu with potential fn
    if type(a:items) == v:t_dict
        for [l:k, l:v] in items(a:items)
            let l:files = type(l:v) == v:t_string ? split(l:v) : l:v
            for l:f in l:files
                if filereadable(l:f)
                    execute 'amenu L&ocations.' . a:heading . '.' . l:k .
                        \   ' :e ' . l:f . '<CR>'
                    break
                endif
            endfor
        endfor
    else
        let l:files = type(a:items) == v:t_string ? [a:items] : a:items
        for l:f in l:files
            if filereadable(l:f)
                execute 'amenu L&ocations.' . a:heading .' :e ' . l:f . '<CR>'
                break
            endif
        endfor
    endif
endfunction

call DefineMenu('&Awesome', {
    \ 'rc': g:xdg_config_dir . '/awesome/rc.moon',
    \ 'theme':  g:xdg_config_dir . '/awesome/themes/jnrowe/theme.moon',
\ })

call DefineMenu('&Openbox', {
    \ 'autostart': g:xdg_config_dir . '/openbox/autostart.sh',
    \ 'menu': g:xdg_config_dir . '/openbox/menu.xml',
    \ 'rc': g:xdg_config_dir . '/openbox/rc.xml',
\ })

call DefineMenu('&gitconfig', [
    \   g:xdg_config_dir . '/git/config',
    \   '~/.gitconfig'
    \ ]
\ )

call DefineMenu('&python',
    \ [
    \   expand('$PYTHONSTARTUP'),
    \   g:xdg_config_dir . '/python/rc'
    \ ],
\ )

call DefineMenu('&Ledger', g:xdg_data_dir . '/ledger/ledger.dat.gpg')

call DefineMenu('&vim', {
    \ '&dein': '~/.vim/dein.vim',
    \ '&rc': '~/.vim/vimrc',
    \ 'rc-&local': '~/.vim/localcfg/',
\ })

call DefineMenu('&zsh', {
    \ '&completions': '~/.no_my_zsh/completion/',
    \ '&configs': '~/.no_my_zsh/config/',
    \ '&plugins': '~/.no_my_zsh/plugin/',
    \ '&zshrc': '~/.no_my_zsh/zshrc',
\ })

call DefineMenu('&xorg', {
    \ 'X&modmap': '~/.Xmodmap',
    \ 'X&resources': '~/.Xresources',
    \ 'X&initrc': '~/.xinitrc',
\ })

call DefineMenu('&freetype', [
    \   g:xdg_config_dir . '/fontconfig/fonts.conf',
    \   '~/.fonts.conf',
    \ ],
\ )

call DefineMenu('&gtk', '~/.gtkrc-2.0')
