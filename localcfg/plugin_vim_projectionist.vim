if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
    execute "let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1"
endif

" PKG_LICENSE_DIR is set on most of the systems I use to an appropriate
" distro-specific location for licenses; /usr/share/licenses,
" /var/lib/repos/gentoo/licenses, &c.
" If I used licenses where there wasn't a unique convention for the filename
" then I'd need something more powerful, but I don't.
if exists("$PKG_LICENSE_DIR")
    let g:projectionist_heuristics = {"Makefile|all.do|setup.py": {}}
    for [s:f, s:t] in [
        \   ["COPYING", "GPL-3"],
        \   ["COPYING.LIB", "LGPL-3"],
        \   ["LICENSE", "MIT"]
        \ ]
        let g:projectionist_heuristics["Makefile|all.do|setup.py"][s:f] = {
            \   "template": readfile(expand("$PKG_LICENSE_DIR/") . s:t),
            \   "type": tolower(split(s:t, "-")[0]),
            \ }
    endfor
endif
