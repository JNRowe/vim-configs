CTAGS ::= exuberant-ctags

TARGETS ::= doc/tags tags/libc.ctags \
	$(patsubst /usr/lib/%, tags/%.ctags, $(wildcard /usr/lib/python*)) \
	$(patsubst /usr/lib/ruby/%, tags/ruby%.ctags, \
		$(wildcard /usr/lib/ruby/[0-9]*))

HTML ::= $(patsubst %.rst, %.html, $(wildcard *.rst))

ifdef QUIET
SILENT ::= @
endif

.PHONY: clean init-external update-external

all: $(TARGETS) $(HTML)

%.html: %.rst
	$(info - Generating $@)
	$(SILENT)rst2html.py $< $@

tags/python%.ctags: /usr/lib/python%
	$(info - Updating $(notdir $<) tags)
	$(SILENT)$(CTAGS) --exclude=test_* --exclude=tests.py --exclude=test.py \
		--exclude=*/test/* --exclude=*/tests/* --languages=python \
		-R -f $@ $<

tags/ruby%.ctags: /usr/lib/ruby/%
	$(info - Updating ruby v$(notdir $<) tags)
	$(SILENT)$(CTAGS) --languages=ruby -R -f $@ $<

LIBC_INCS ::= $(shell qlist glibc | grep include)
ifndef LIBC_INCS
LIBC_INCS ::= $(shell dpkg -L libc6-dev | grep include)
ifndef LIBC_INCS
$(error LIBC_INCS is undefined. Not on Gentoo or Debian?)
endif
endif
tags/libc.ctags: $(LIBC_INCS)
	$(info - Updating glibc tags)
	$(SILENT)$(CTAGS) -f $@ $^

doc/tags: $(filter-out doc/tags, $(wildcard doc/*))
	$(info - Updating help tags)
	$(SILENT)vim -X -u NONE -c 'helptags $(dir $@)' -c ':q' </dev/null &>/dev/null

clean:
	$(info - Cleaning generated files)
	$(SILENT)rm -f $(TARGETS)

init-external:
	$(info - Initiating plugin bundles)
	vim -c ':NeoBundleInstall' -c ':qa'

update-external:
	$(info - Updating plugin bundles)
	vim -c ':NeoBundleUpdate' -c ':qa'
