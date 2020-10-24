#!/bin/sh
# toolchain - Set defaults for toolchain variables.

if grep -q '^ID=arch$' /etc/os-release; then
    export CC="clang"
    export CXX="clang++"
    export LD="ld.lld"
fi

