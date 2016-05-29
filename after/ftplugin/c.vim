" Use :make to compile C/C++, even without a Makefile
if !filereadable('Makefile')
    let &makeprg = 'gcc -o %< %'
endif
