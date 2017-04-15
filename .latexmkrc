$pdflatex = "xelatex -synctex=1 %O %S";
$pdf_mode = 1;
$postscript_mode = 0;
$dvi_mode = 0;
$makeindex = 'makeindex -s gind.ist %O -o %D %S';
add_cus_dep('glo', 'gls', 0, 'makegls');
sub makegls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}
$clean_ext = 'bbl glo gls hd loa log synctex.gz xdv';
