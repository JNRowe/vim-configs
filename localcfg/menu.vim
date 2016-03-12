" It checks for, what I consider to be, the most important file in a set and
" only shows the menu if it is exists.  This allows us to list files for
" different hosts without cluttering the menu too much.

if filereadable(g:xdg_config_dir . "/awesome/rc.moon")
    amenu L&ocations.&Awesome.rc
        \ :execute("e " . g:xdg_config_dir . "/awesome/rc.moon")<CR>
    amenu L&ocations.&Awesome.theme
        \ :execute("e " . g:xdg_config_dir .
        \          "/awesome/themes/jnrowe/theme.moon")<CR>
endif
if filereadable(g:xdg_config_dir . "/openbox/rc.xml")
    amenu L&ocations.&Openbox.autostart
        \ :execute("e " . g:xdg_config_dir . "/openbox/autostart.sh")<CR>
    amenu L&ocations.&Openbox.menu
        \ :execute("e " . g:xdg_config_dir . "/openbox/menu.xml")<CR>
    amenu L&ocations.&Openbox.rc
        \ :execute("e " . g:xdg_config_dir . "/openbox/rc.xml")<CR>
endif
if filereadable(g:xdg_config_dir . "/git/config")
    amenu L&ocations.&gitconfig
        \ :execute("e " . g:xdg_config_dir . "/git/config")<CR>
elseif filereadable(expand("~/.gitconfig"))
    amenu L&ocations.&gitconfig :e ~/.gitconfig<CR>
endif
if filereadable(expand("$PYTHONSTARTUP"))
    amenu L&ocations.&python
        \ :execute("e " . expand("$PYTHONSTARTUP"))<CR>
elseif filereadable(g:xdg_config_dir . "/python/rc")
    amenu L&ocations.&python
        \ :execute("e " . g:xdg_config_dir . "/python/rc")<CR>
endif
if filereadable(g:xdg_data_dir . "/ledger/ledger.dat.gpg")
    amenu L&ocations.&ledger
        \ :execute("e " . g:xdg_data_dir . "/ledger/ledger.dat.gpg")<CR>
endif
if filereadable(expand("~/.vim/vimrc"))
    amenu L&ocations.&vim.&rc :e ~/.vim/vimrc<CR>
    amenu L&ocations.&vim.rc-&local :e ~/.vim/localcfg/<CR>
    amenu L&ocations.&vim.&neobundle :e ~/.vim/neobundle.vim<CR>
endif
if filereadable(expand("~/.no_my_zsh/zshrc"))
    amenu L&ocations.&zsh.&completions :e ~/.no_my_zsh/completion/<CR>
    amenu L&ocations.&zsh.&configs :e ~/.no_my_zsh/config/<CR>
    amenu L&ocations.&zsh.&plugins :e ~/.no_my_zsh/plugin/<CR>
    amenu L&ocations.&zsh.&zshrc :e ~/.no_my_zsh/zshrc<CR>
endif
amenu L&ocations.&xorg.X&modmap :e ~/.Xmodmap
amenu L&ocations.&xorg.X&resources :e ~/.Xresources
amenu L&ocations.&xorg.X&initrc :e ~/.xinitrc
if filereadable(g:xdg_config_dir . "/fontconfig/fonts.conf")
    amenu L&ocations.&freetype
        \ :execute("e " . g:xdg_config_dir . "/fontconfig/fonts.conf")<CR>
elseif filereadable(expand("~/.fonts.conf"))
    amenu L&ocations.&freetype :e ~/.fonts.conf<CR>
endif
if filereadable(expand("~/.gtkrc-2.0"))
    amenu L&ocations.&gtk :e ~/.gtkrc-2.0<CR>
endif
