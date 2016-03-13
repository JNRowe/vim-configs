if exists("g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?"))
    finish
else
     execute("let g:loaded_lcfg_" . expand("<sfile>:t:r:gs?[\.-]?_?") . " = 1")
endif

" Common-ish to me mail abbreviations
ia AFAICR as far as I can remember
ia AFAIK as far as I know
ia AKA also known as
ia ASAP as soon as possible
ia FAF fire'n'forget
ia FINR fixed in the next release
ia FWIW for what it's worth
ia FYI for your information
ia HTH hope that helps
ia IIRC if I remember correctly
ia IMHO in my humble opinion
ia IMNSHO in my not so humble opinion
ia IMO in my opinion
ia OTOH on the other hand
ia RTFM read the friendly manual
ia WDYT what do you think?
ia WIBNI wouldn't it be nice if
ia YMMV your mileage may vary

" Date
ia _t  <C-R>=strftime("%T")<CR>
ia _d  <C-R>=strftime("%F")<CR>
ia _dt <C-R>=strftime("%FT%T%z")<CR>
