$pdflatex = "xelatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 %O %S";
$xelatex = "xelatex -file-line-error -halt-on-error -interaction=nonstopmode -no-pdf -synctex=1 %O %S";
$xdvipdfmx="xdvipdfmx -E -o %D %O %S";

$pdf_mode = 1;
$dvi_mode = 0;
$postscript_mode = 0;

$bibtex_use = 1.5;

$go_mode = 1;

$clean_ext = 'glo gls hd loa synctex.gz xdv';

$makeindex = 'makeindex -s gind.ist %O -o %D %S';
add_cus_dep('glo', 'gls', 0, 'makegls');
sub makegls {
    system("makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"");
}
