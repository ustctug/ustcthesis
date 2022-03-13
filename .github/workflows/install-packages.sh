#!/bin/bash
set -e

export PATH="/tmp/texlive/bin/x86_64-linux:$PATH";

XECJK_PKGS="fontspec ulem xecjk xetex";
CTEX_PKGS="cjk ctex zhnumber";
ALGORITHM2E_PKGS="algorithm2e ifoddpage relsize";
BIBLATEX_PKGS="biber biblatex biblatex-gb7714-2015 xstring";
NOMENCL_PKGS="nomencl koma-script xkeyval";

BIN_PKGS="latexmk l3build";
REQUIRED_PKGS="$XECJK_PKGS $CTEX_PKGS caption footmisc filehook notoccite \
    multirow titlesec unicode-math";
FONT_PKGS="fandol tex-gyre xits";
EXTRA_PKGS="$ALGORITHM2E_PKGS $BIBLATEX_PKGS booktabs $NOMENCL_PKGS siunitx";
DOC_PKGS="hypdoc listings xcolor";

tlmgr install $BIN_PKGS $REQUIRED_PKGS $FONT_PKGS $EXTRA_PKGS $DOC_PKGS;
