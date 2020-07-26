#!/bin/sh
# ssh-agent - Take in the ssh-agent(1) environment variables.

# ...without creating duplicate agents!
_ssh_agent_uid=$(id -u)
if ! [ -f "${XDG_RUNTIME_DIR}"/ssh-agent-"${_ssh_agent_uid}".sh ] \
    || [ -z "${SSH_AGENT_PID}" ] \
    || ! kill -0 "${SSH_AGENT_PID}"; then
    ssh-agent | grep -v '^echo' >"${XDG_RUNTIME_DIR}"/ssh-agent-"${_ssh_agent_uid}".sh
fi

. "${XDG_RUNTIME_DIR}"/ssh-agent-"${_ssh_agent_uid}".sh
ssh-add -q

unset -v _ssh_agent_uid
