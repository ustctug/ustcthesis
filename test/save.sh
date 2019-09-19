for testfile in test/testfiles/*.tex; do
    test="$(basename "$testfile" .tex)";
    l3build save --quiet "$test";
done

for testfile in test/testfiles-toc/*.tex; do
    test="$(basename "$testfile" .tex)";
    l3build save --quiet --config test/config-toc "$test";
done

for testfile in test/testfiles-nomencl/*.tex; do
    test="$(basename "$testfile" .tex)";
    l3build save --quiet --config test/config-nomencl "$test";
done

for testfile in test/testfiles-bib/*.tex; do
    test="$(basename "$testfile" .tex)";
    l3build save --quiet --config test/config-bib "$test";
done
