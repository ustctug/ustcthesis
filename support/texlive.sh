#!/bin/bash

export PATH="/tmp/texlive/bin/x86_64-linux:$PATH"

if ! command -v tlmgr > /dev/null; then
    REMOTE="http://mirror.ctan.org/systems/texlive/tlnet"
    INSTALL="/tmp/install-texlive"
    mkdir -p $INSTALL
    curl -sSL $REMOTE/install-tl-unx.tar.gz | tar -xzv -C $INSTALL --strip-components=1
    $INSTALL/install-tl -profile ./support/texlive.profile
fi

tlmgr install latexmk xetex

tlmgr install algorithm2e booktabs caption cjk ctex environ etoolbox fontspec \
footmisc ifoddpage l3kernel l3packages listings ms pgf relsize thumbpdf \
titlesec trimspaces ulem was xcolor xecjk xstring zhnumber

tlmgr install fandol symbol zapfding

tlmgr update --self --all −−no−auto−install
