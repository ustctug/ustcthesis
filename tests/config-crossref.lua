testfiledir = "./tests/testfiles-crossref"

checkruns = 2

function runtest_tasks(name, run)
  if run == 1 then
    local nlo_file = normalize_path(string.format("%s/%s.nlo", testdir, name))
    if fileexists(nlo_file) then
        return string.format("makeindex -s nomencl.ist -o %s.nls %s.nlo", name, name)
    else
        return ""
    end
  else
    return ""
  end
end
