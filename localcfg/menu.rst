``localcfg/menu.vim``
=====================

We all know the menu bar **steals** valuable screen real estate, but
occasionally it can be useful for accessing hierarchical information.  Therefore
we add a :ref:`toggle binding <gui-toggles>`, but also learn to use ``emenu``
for even easier access.

Function to generate common file menu.  Items can be specified as:

================ =========================================
Signature        Maps to
================ =========================================
``str``          Potential filename
``[str]``        List of potential filenames
``{str: str}``   Submenu with potential filename
``{str: [str]}`` Submenu with list of potential filenames
================ =========================================

.. code-block:: vim

    function! s:DefineMenu(heading, items)
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

.. code-block:: vim

    call s:DefineMenu('&Awesome', {
        \ 'rc': g:xdg_config_dir . '/awesome/rc.moon',
        \ 'theme':  g:xdg_config_dir . '/awesome/themes/jnrowe/theme.moon',
    \ })

.. code-block:: vim

    call s:DefineMenu('&Dwm', {
        \ 'config.h': g:xdg_config_dir . '/dwm/config.h',
        \ 'theme':  g:xdg_config_dir . '/dwm/themes/theme.h',
    \ })

.. code-block:: vim

    call s:DefineMenu('&Openbox', {
        \ 'autostart': g:xdg_config_dir . '/openbox/autostart.sh',
        \ 'menu': g:xdg_config_dir . '/openbox/menu.xml',
        \ 'rc': g:xdg_config_dir . '/openbox/rc.xml',
    \ })

.. code-block:: vim

    call s:DefineMenu('&gitconfig', [
        \   g:xdg_config_dir . '/git/config',
        \   '~/.gitconfig'
        \ ]
    \ )

.. code-block:: vim

    call s:DefineMenu('&python',
        \ [
        \   expand('$PYTHONSTARTUP'),
        \   g:xdg_config_dir . '/python/rc'
        \ ],
    \ )

.. code-block:: vim

    call s:DefineMenu('&Ledger', g:xdg_data_dir . '/ledger/ledger.dat.gpg')

.. code-block:: vim

    call s:DefineMenu('&vim', {
        \ '&dein': '~/.vim/dein.vim',
        \ '&rc': '~/.vim/vimrc',
        \ 'rc-&local': '~/.vim/localcfg/',
    \ })

.. code-block:: vim

    call s:DefineMenu('&zsh', {
        \ '&completions': '~/.no_my_zsh/completion/',
        \ '&configs': '~/.no_my_zsh/config/',
        \ '&plugins': '~/.no_my_zsh/plugin/',
        \ '&zshrc': '~/.no_my_zsh/zshrc',
    \ })

.. code-block:: vim

    call s:DefineMenu('&xorg', {
        \ 'X&modmap': '~/.Xmodmap',
        \ 'X&resources': '~/.Xresources',
        \ 'X&initrc': '~/.xinitrc',
    \ })

.. code-block:: vim

    call s:DefineMenu('&freetype', [
        \   g:xdg_config_dir . '/fontconfig/fonts.conf',
        \   '~/.fonts.conf',
        \ ],
    \ )

.. code-block:: vim

    call s:DefineMenu('&gtk2', '~/.gtkrc-2.0')
    call s:DefineMenu('&gtk3', g:xdg_config_dir . '/gtk-3.0/settings.ini')
