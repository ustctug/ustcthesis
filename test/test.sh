test="$1";
for config in main crossref nomencl bibtex biblatex; do
    if [[ "$config" == "main" ]]; then
        test_dir="test/testfiles";
    else
        test_dir="test/testfiles-$config";
    fi
    file_path="$test_dir/$test.tex";
    if [ -f "$file_path" ]; then
        if [[ "$config" == "main" ]]; then
            l3build save --halt-on-error "$test" || exit 1;
            xdvipdfmx "build/test/$test.xdv" -o "$test_dir/$test.pdf";
        else
            l3build save --halt-on-error --config "test/config-$config" "$test" || exit 1;
            xdvipdfmx "build/test-test/config-$config/$test.xdv" -o "$test_dir/$test.pdf";
        fi
        open "$test_dir/$test.pdf";
        break;
    fi
done
