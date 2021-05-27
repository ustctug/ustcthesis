save_file () {
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
            else
                l3build save --halt-on-error --config "test/config-$config" "$test" || exit 1;
            fi
            break;
        fi
    done
}

save_config () {
    config="$1";
    if [[ "$config" == "main" ]]; then
        for testfile in test/testfiles/*.tex; do
            test="$(basename "$testfile" .tex)";
            l3build save --halt-on-error "$test" || exit 1;
        done
    else
        for testfile in "test/testfiles-$config"/*.tex ; do
            test="$(basename "$testfile" .tex)";
            l3build save --halt-on-error --config "test/config-$config" "$test" || exit 1;
        done
    fi
}


if [[ $# -eq 0 ]]; then
    for config in main crossref nomencl bibtex biblatex; do
        save_config $config;
    done
else
    case $1 in
        main|crossref|nomencl|bibtex|biblatex)
            save_config "$1";
            ;;

        *)
            save_file "$1";
            ;;
    esac
fi
