CTAGS := exuberant-ctags

TARGETS := doc/tags tags/libc.ctags \
	$(patsubst /usr/lib/%, tags/%.ctags, $(wildcard /usr/lib/python*)) \
	$(patsubst /usr/lib/ruby/%, tags/ruby%.ctags, \
		$(wildcard /usr/lib/ruby/[0-9]*))

all: $(TARGETS)

tags/python%.ctags: /usr/lib/python%
	$(info - Updating $(notdir $<) tags)
	$(CTAGS) --exclude=test_* --exclude=tests.py --exclude=test.py \
		--exclude=*/test/* --exclude=*/tests/* --languages=python \
		-R -f $@ $<

tags/ruby%.ctags: /usr/lib/ruby/%
	$(info - Updating ruby v$(notdir $<) tags)
	$(CTAGS) --languages=ruby \
		-R -f $@ $<

LIBC_INCS := $(shell qlist glibc | grep include)
ifndef LIBC_INCS
LIBC_INCS := $(shell dpkg -L libc6-dev | grep include)
ifndef LIBC_INCS
$(error LIBC_INCS is undefined. Not on Gentoo or Debian?)
endif
endif
tags/libc.ctags: $(LIBC_INCS)
	$(info - Updating glibc tags)
	$(CTAGS) -f $@ $^

doc/tags: $(filter-out doc/tags, $(wildcard doc/*))
	$(info - Updating help tags)
	vim -X -u NONE -c 'helptags $(dir $@)' -c ':q' </dev/null &>/dev/null

clean:
	$(warn - Cleaning generated files)
	rm -f $(TARGETS)

