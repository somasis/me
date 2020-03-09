me_git := $(HOME)/git/me.git

POUNCE_HOST := angela.somas.is
POUNCE_NETWORKS := \
	somasis@irc.freenode.net somasis@irc.oftc.net

CATGIRL_FILES := \
	$(foreach network,$(POUNCE_NETWORKS),.config/catgirl/$(network).conf)

POUNCE_FILES := \
	$(foreach network,$(POUNCE_NETWORKS),.config/pounce/$(network).conf)

CONFIG_FILES := \
	$(CATGIRL_FILES) $(POUNCE_FILES)

.PHONY: all
all: config

.PHONY: config
config: $(CONFIG_FILES)

.PHONY: pounce-$(POUNCE_HOST)
pounce-$(POUNCE_HOST): $(POUNCE_FILES)
	rsync -ru $^ pounce@$(POUNCE_HOST):~/.config/pounce
	ssh pounce@$(POUNCE_HOST) mkdir -p '~/.cache/pounce'

.PHONY: pull
pull:
	git --git-dir="$(me_git)" --work-tree="$(HOME)" pull

.DELETE_ON_ERROR: .config/catgirl/pounce-%.conf
.config/catgirl/%.conf: .config/catgirl/pounce.in .config/catgirl/catgirl.in .config/catgirl/
	pp $< $(POUNCE_HOST) $* > $@

.DELETE_ON_ERROR: .config/pounce/%.conf
.config/pounce/%.conf: .config/pounce/pounce.in .config/pounce/
	pp $< $(POUNCE_HOST) $* > $@

.config/%/:
	mkdir -p .config/$*

