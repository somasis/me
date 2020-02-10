bindir ?= $(XDG_BINARY_HOME)
bindir ?= $(HOME)/.local/bin

BINS := $(patsubst %.in, %, $(wildcard bin/*))

INSTALLS := \
	$(addprefix $(DESTDIR)$(bindir)/,$(BINS:bin/%=%)) \

.PHONY: all
all: bin

.PHONY: install
install: $(INSTALLS)

.PHONY: bin
bin: $(BINS)

$(DESTDIR)$(bindir)/%: bin/%
	install -D $< $@

