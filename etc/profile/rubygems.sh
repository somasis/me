#!/bin/sh

# rubygems
if command -v ruby >/dev/null 2>&1;then
    export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:${PATH}"
fi
