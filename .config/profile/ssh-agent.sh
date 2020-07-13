#!/bin/sh
# ssh-agent - Take in the ssh-agent(1) environment variables.

# ...without creating duplicate agents!
if ! [ -f "${XDG_RUNTIME_DIR}"/ssh-agent.sh ] \
    || [ -z "${SSH_AGENT_PID}" ] \
    || ! kill -0 "${SSH_AGENT_PID}"; then
    ssh-agent | grep -v '^echo' >"${XDG_RUNTIME_DIR}"/ssh-agent.sh
fi

. "${XDG_RUNTIME_DIR}"/ssh-agent.sh
ssh-add -q
