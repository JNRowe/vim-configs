CTAGS := exuberant-ctags

TARGETS := doc/tags tags/libc.ctags

all: $(TARGETS)

LIBC_INCS := $(shell qlist glibc | grep include)
ifndef LIBC_INCS
LIBC_INCS := $(shell dpkg -L libc6-dev | grep include)
ifndef LIBC_INCS
$(error LIBC_INCS is undefined. Not on Gentoo or Debian?)
endif
endif
tags/libc.ctags: $(LIBC_INCS)
	$(CTAGS) -f $@ $^

doc/tags: $(filter-out doc/tags, $(wildcard doc/*))
	vim -X -u NONE -c 'helptags $(dir $@)' -c ':q' </dev/null &>/dev/null

clean:
	rm -f $(TARGETS)

