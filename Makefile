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
	sed '/^#/d' ${NEWSBOAT} | urls | xe -N0 -Fv urlck
	cat ${NEWSBOAT} > $@

FRC:
