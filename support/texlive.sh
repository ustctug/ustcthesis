#!/bin/bash

export PATH="/tmp/texlive/bin/x86_64-linux:$PATH"

if ! command -v tlmgr > /dev/null; then
    REMOTE="http://mirror.ctan.org/systems/texlive/tlnet"
    INSTALL="/tmp/install-texlive"
    mkdir -p $INSTALL
    curl -sSL $REMOTE/install-tl-unx.tar.gz | tar -xzv -C $INSTALL --strip-components=1
    $INSTALL/install-tl -profile ./support/texlive.profile
fi

tlmgr install latexmk \
    fontspec l3kernel l3packages xetex \
    cjk ctex environ ms trimspaces ulem xecjk zhnumber \
    fandol tex-gyre stix2-otf xits \
    caption etoolbox filehook footmisc pgf symbol titlesec unicode-math \
    xcolor zapfding \
    booktabs listings thumbpdf \
    algorithm2e ifoddpage relsize

tlmgr update --self --all −−no−auto−install
