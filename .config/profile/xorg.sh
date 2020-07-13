#!/bin/sh
# xorg - Set environment variables for xXorg utility XDG complicance

# Xorg
export XAUTHORITY="${XDG_RUNTIME_DIR}"/Xauthority
export XINITRC="${XDG_CONFIG_HOME}"/X11/xinit/xinitrc
export XSERVERRC="${XDG_CONFIG_HOME}"/X11/xinit/xserverrc

# libice
export ICEAUTHORITY="${XDG_RUNTIME_DIR}"/ICEauthority

