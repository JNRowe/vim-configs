TARGETS := doc/tags

all: $(TARGETS)

doc/tags: $(filter-out doc/tags, $(wildcard doc/*))
	vim -X -u NONE -c 'helptags $(dir $@)' -c ':q' </dev/null &>/dev/null

clean:
	rm -f $(TARGETS)

