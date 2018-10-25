``vimrc.d/misc.vim``
====================

Show highlight group of the current text, taken from vim wiki

.. code-block:: vim

    command! ShowHighlightGroup
        \ echo 'hi<' . synIDattr(synID(line('.'), col('.'), v:true), 'name') .
        \   '> trans<' . synIDattr(synID(line('.'), col('.'), v:false), 'name') .
        \   '> lo<' . synIDattr(synIDtrans(synID(line('.'), col('.'), v:true)),
        \                       'name') .
        \   '>'

Flag toggling function

.. code-block:: vim

    function! ToggleFlag(option, flag)
        let l:optstr = eval('&' . a:option)
        if stridx(l:optstr, ',') == -1
            " Simple char options like 'fo'
            let l:flip = '+-'[l:optstr =~# a:flag]
        else
            " Comma lists options like 'cot'
            let l:flip = '+-'[index(split(l:optstr, ','), a:flag) != -1]
        endif
        execute 'set ' . a:option . l:flip . '=' . a:flag
    endfunction

User email address, as used by various plugins

.. code-block:: vim

    silent let g:user_email = systemlist('git -C ~ config user.name')[0] .
        \ ' <' . systemlist('git -C ~ config user.email')[0] . '>'
