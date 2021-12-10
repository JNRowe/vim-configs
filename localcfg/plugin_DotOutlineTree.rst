``localcfg/plugin_DotOutlineTree.vim``
======================================

::

    augroup jnrowe_DotOutlineTree
        autocmd!

Disable line numbering and fold columns as they’re of little use here::

        autocmd BufNewFile DotOutlineTree*
        \   setlocal foldcolumn=0 nonumber norelativenumber

We don’t need spelling errors displayed here as they’re already shown in the
main buffer::

        autocmd BufNewFile DotOutlineTree* setlocal nospell

Use Unicode bullets to mark section levels as this feels nicer to me.  This
allows to see some basic colouring for depth, and also increases the text
density in narrow windows.

::

        autocmd BufNewFile DotOutlineTree*
        \   syntax match rstList "^ \{2\}\ze[^ ]" conceal cchar=• |
        \   syntax match rstList "^ \{4\}\ze[^ ]" conceal cchar=◦

::

    augroup END
