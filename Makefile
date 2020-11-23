me_git := ${HOME}/git/me.git

IRC_HOST = angela.somas.is

NEWSBOAT_URLS := \
	${XDG_CONFIG_HOME}/newsboat/urls.pub ${XDG_CONFIG_HOME}/newsboat/urls.secret

.PHONY: all
all: kak newsboat

.PHONY: kak
kak: ${XDG_DATA_HOME}/kak/plugins/plug.kak

.PHONY: newsboat
newsboat: ${XDG_CONFIG_HOME}/newsboat/urls

${XDG_DATA_HOME}/kak/plugins/plug.kak:
	git clone --depth=1 https://github.com/robertmeta/plug.kak.git ${XDG_DATA_HOME}/kak/plugins/plug.kak

.PHONY: ${IRC_HOST}
${IRC_HOST}: pounce-${IRC_HOST} litterbox-${IRC_HOST}

.PHONY: pounce-${IRC_HOST}
pounce-${IRC_HOST}:
	rsync -ru --delete-after --exclude /home/pounce/.config/pounce/${IRC_HOST} ${XDG_CONFIG_HOME}/pounce/ pounce@${IRC_HOST}:~/.config/pounce
	ssh pounce@${IRC_HOST} mkdir -p '~/.cache/pounce'

.PHONY: litterbox-${IRC_HOST}
litterbox-${IRC_HOST}:
	rsync -ru --delete-after ${XDG_CONFIG_HOME}/litterbox/ pounce@${IRC_HOST}:~/.config/litterbox
	ssh pounce@${IRC_HOST} mkdir -p "~/.local/share/litterbox" "~/.cache/litterbox"

.PHONY: catgirl-${IRC_HOST}
catgirl-${IRC_HOST}:
	rsync -ru --delete-after ${XDG_CONFIG_HOME}/catgirl/ somasis@${IRC_HOST}:~/.config/catgirl
	ssh somasis@${IRC_HOST} mkdir -p "~/.local/share/catgirl" "~/.cache/catgirl"

.PHONY: pull
pull:
	git --git-dir="${me_git}" --work-tree="${HOME}" pull

${XDG_CONFIG_HOME}/%/:
	mkdir -p ${XDG_CONFIG_HOME}/$*

${XDG_CONFIG_HOME}/newsboat/urls: ${NEWSBOAT_URLS}
	cat ${NEWSBOAT_URLS} > $@
