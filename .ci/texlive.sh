#!/bin/bash

export PATH="/tmp/texlive/bin/x86_64-linux:$PATH"

if ! command -v tlmgr > /dev/null; then
    REMOTE="http://mirror.ctan.org/systems/texlive/tlnet";
    INSTALL="/tmp/install-texlive";
    mkdir -p $INSTALL;
    curl -sSL $REMOTE/install-tl-unx.tar.gz | tar -xzv -C $INSTALL \
        --strip-components=1;
    $INSTALL/install-tl -profile ./.ci/texlive.profile;
fi

tlmgr update --self --all --reinstall-forcibly-removed;

tlmgr install latexmk l3build \
    fontname fontspec l3kernel l3packages xetex \
    cjk ctex environ ms trimspaces ulem xecjk zhnumber \
    caption filehook footmisc notoccite titlesec unicode-math \
    fandol tex-gyre xits \
    booktabs listings thumbpdf xcolor zapfding \
    algorithm2e ifoddpage nomencl relsize siunitx;
