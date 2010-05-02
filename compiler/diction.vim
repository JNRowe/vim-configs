if exists("current_compiler")
  finish
endif
let current_compiler = "diction"

setlocal makeprg=diction\ -s\ %
setlocal efm=%f:%l:\ %m
