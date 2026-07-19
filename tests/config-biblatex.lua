supportdir = "."
testfiledir = "./tests/testfiles-biblatex"

checksuppfiles = {"*.bib"}

checkruns = 2

function runtest_tasks(name, run)
  if run == 1 then
    return "biber --quiet " .. name
  else
    return ""
  end
end
