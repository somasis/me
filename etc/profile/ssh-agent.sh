#!/bin/sh
# ssh-agent - Set ssh-agent(1) environment variables.
# The agent itself is expected to be managed by catsitd-user(8).

export SSH_AGENT_SOCK="${XDG_RUNTIME_DIR}/ssh/agent"
