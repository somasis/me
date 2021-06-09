me_git := ${HOME}/src/me.git

NEWSBOAT := ${XDG_CONFIG_HOME}/newsboat/urls.pub ${XDG_CONFIG_HOME}/newsboat/urls.secret
DUNST := ${XDG_CONFIG_HOME}/dunst/dunstrc.pub ${XDG_CONFIG_HOME}/dunst/dunstrc.secret

all: FRC dunst newsboat

dunst: FRC ${XDG_CONFIG_HOME}/dunst/dunstrc

newsboat: FRC ${XDG_CONFIG_HOME}/newsboat/urls

${XDG_CONFIG_HOME}/%/:
	mkdir -p ${XDG_CONFIG_HOME}/$*

${XDG_CONFIG_HOME}/dunst/dunstrc: ${DUNST}
	cat ${DUNST} > $@

${XDG_CONFIG_HOME}/newsboat/urls: ${NEWSBOAT}
	sed '/^#/d' ${NEWSBOAT} | urls | xe -v -N1 -j4 -F urlck
	cat ${NEWSBOAT} > $@

qutebrowser-prune: FRC qutebrowser-quickmarks-prune qutebrowser-bookmarks-prune

qutebrowser-quickmarks-prune: FRC
	sed -E 's|.* ||' "${XDG_CONFIG_HOME}/qutebrowser/quickmarks" | xe -v -N1 -j 4 -F urlck

qutebrowser-bookmarks-prune: FRC
	cut -d ' ' -f1 <"${XDG_CONFIG_HOME}/qutebrowser/bookmarks/urls" | xe -v -N1 -j 4 -F urlck

FRC:
