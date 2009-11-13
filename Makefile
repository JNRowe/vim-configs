CTAGS := exuberant-ctags
STOW := stow
STOW_FLAGS := --ignore=".git(|attributes|ignore)" \
	--ignore="(Rakefile|snippets)" -d external -t .
ifdef STOW_DEBUG
STOW_FLAGS += -n -v
endif

TARGETS := doc/tags tags/libc.ctags \
	$(patsubst /usr/lib/%, tags/%.ctags, $(wildcard /usr/lib/python*)) \
	$(patsubst /usr/lib/ruby/%, tags/ruby%.ctags, \
		$(wildcard /usr/lib/ruby/[0-9]*))

PACKAGES = $(wildcard external/*)
PACKAGE_NAMES = $(foreach pkg, $(PACKAGES), $(notdir $(pkg)))

.PHONY: clean update-external stow-packages unstow-packages

all: $(TARGETS) stow-packages

stow-packages: $(PACKAGES)
	$(info - Stowing $(PACKAGE_NAMES))
	$(STOW) $(STOW_FLAGS) $(PACKAGE_NAMES)
unstow-packages: $(PACKAGES)
	$(info - Unstowing $(PACKAGE_NAMES))
	$(STOW) $(STOW_FLAGS) -D $(PACKAGE_NAMES)

stow-%: external/%
	$(info - Stowing $(notdir $<))
	$(STOW) $(STOW_FLAGS) $(notdir $<)
unstow-%:
	$(info - Unstowing $(subst unstow-,,$@))
	$(STOW) $(STOW_FLAGS) -D $(subst unstow-,,$@)

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
	$(info - Cleaning generated files)
	rm -f $(TARGETS)

update-external:
	$(info - Updated git submodules)
	git submodule update

