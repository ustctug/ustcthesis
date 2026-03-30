test="$(basename $1 .tex)";
baseline_dir="tests/baseline";
diff_dir="tests/diff";
baseline_path="$baseline_dir/$test.pdf";
for config in main crossref nomencl bibtex biblatex; do
    if [[ "$config" == "main" ]]; then
        test_dir="tests/testfiles";
        build_dir="build/test";
    else
        test_dir="tests/testfiles-$config";
        build_dir="build/test-tests/config-$config";
    fi
    file_path="$test_dir/$test.tex";
    if [ -f "$file_path" ]; then
        if [[ "$config" == "main" ]]; then
            l3build save --halt-on-error "$test" || exit 1;
        else
            l3build save --halt-on-error --config "tests/config-$config" "$test" || exit 1;
        fi
        output_path="$build_dir/$test.pdf";
        xdvipdfmx "$build_dir/$test.xdv" -o "$output_path";
        if [ -f "$baseline_path" ]; then
            if [ ! -d "$diff_dir" ]; then
                mkdir -p "$diff_dir";
            fi
            diff_path="$diff_dir/$test-diff.pdf";
            diff-pdf --output-diff "$diff_path" "$baseline_path" "$output_path";
            open "$diff_path";
        else
            open "$output_path";
        fi
        break;
    fi
done
