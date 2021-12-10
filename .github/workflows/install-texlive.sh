#!/bin/bash
set -e

REMOTE="https://mirrors.ctan.org/systems/texlive/tlnet";
INSTALL="/tmp/install-texlive";

# install TeX Live & remove installer
mkdir -p "$INSTALL";
curl -sSL "$REMOTE/install-tl-unx.tar.gz" | tar -xz -C "$INSTALL" \
    --strip-components=1;
"$INSTALL/install-tl" -no-gui -repository $REMOTE \
    -profile .github/workflows/texlive.profile;
rm -rf "$INSTALL";

# add packages with tlmgr
export PATH="/tmp/texlive/bin/x86_64-linux:$PATH";
