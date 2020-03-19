REMOTE="https://mirrors.rit.edu/CTAN/systems/texlive/tlnet";
INSTALL="/tmp/install-texlive";

mkdir -p "$INSTALL";
curl -sSL "$REMOTE/install-tl-unx.tar.gz" | tar -xz -C "$INSTALL" \
    --strip-components=1;
"$INSTALL/install-tl" -no-gui -repository $REMOTE \
    -profile .github/workflows/texlive.profile;

export PATH="/tmp/texlive/bin/x86_64-linux:$PATH";

XETEX_PKGS="fontname fontspec l3packages xetex";
CTEX_PKGS="cjk ctex environ ms trimspaces ulem xecjk zhnumber";
ALGORITHM2E_PKGS="algorithm2e ifoddpage relsize";
HYPERREF_PKGS="bitset letltxmacro pdfescape pdflscape";
NOMENCL_PKGS="nomencl koma-script xkeyval";

BIN_PKGS="latexmk l3build";
REQUIRED_PKGS="$XETEX_PKGS $CTEX_PKGS caption footmisc filehook notoccite \
    titlesec unicode-math";
FONT_PKGS="fandol tex-gyre xits";
EXTRA_PKGS="$ALGORITHM2E_PKGS $HYPERREF_PKGS $NOMENCL_PKGS siunitx";
DOC_PKGS="booktabs listings xcolor";

tlmgr install $BIN_PKGS $REQUIRED_PKGS $FONT_PKGS $EXTRA_PKGS $DOC_PKGS;
