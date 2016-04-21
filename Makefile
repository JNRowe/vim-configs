CTAGS ::= exuberant-ctags

LUA_SOURCES ::= $(wildcard /usr/share/lua/*)
RUBY_SOURCES ::= $(wildcard /usr/lib/ruby/[0-9]*)
TARGETS ::= tags/libc.ctags \
	$(patsubst /usr/share/lua/%, tags/lua%.ctags, \
		$(LUA_SOURCES)) \
	$(patsubst /usr/lib/ruby/%, tags/ruby%.ctags, $(RUBY_SOURCES))

RST_SOURCES ::= $(wildcard *.rst)
HTML ::= $(RST_SOURCES:.rst=.html)

ifdef QUIET
SILENT ::= @
endif

.PHONY: clean update-external display_sources

all: $(TARGETS) $(HTML)

%.html: %.rst
	$(info - Generating $@)
	$(SILENT)rst2html.py $< $@

tags/lua%.ctags: /usr/share/lua/%
	$(info - Updating lua $(notdir $<) tags)
	$(SILENT)$(CTAGS) --languages=lua -R -f $@ $<

tags/ruby%.ctags: /usr/lib/ruby/%
	$(info - Updating ruby v$(notdir $<) tags)
	$(SILENT)$(CTAGS) --exclude=*/test/* --languages=ruby -R -f $@ $<

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

clean:
	$(info - Cleaning generated files)
	$(SILENT)rm -f $(TARGETS)

update-external:
	$(info - Updating plugin bundles)
	$(SILENT)vim -X -c 'call dein#update()' -c ':q'

display_sources:
	@echo $(realpath $(LUA_SOURCES) $(RUBY_SOURCES) \
	        $(RST_SOURCES))
