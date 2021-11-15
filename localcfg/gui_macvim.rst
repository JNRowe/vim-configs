``localcfg/gui_macvim.vim``
===========================

MacOS specific fonts setup::

    set antialias
    set guifont=Menlo:h13

Select colour scheme using system configuration::

    if system('defaults read -g AppleInterfaceStyle') =~# '^Dark'
        colorscheme jnrowe
    else
        colorscheme summerfruit256
    endif
