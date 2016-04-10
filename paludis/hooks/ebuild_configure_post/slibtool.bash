#!/bin/bash

find -name libtool | while read f;do
    echo "slibtool: writing to \"$f\"..." >&2
    mv "$f" "$f".orig
    printf '#!/bin/sh\nexec %s "$@"' "$(type -fPp slibtool)" > "$f"
    chmod +x "$f"
done
