testfiledir = "./test/testfiles-biblatex"

checkruns = 3

function runtest_tasks(name, run)
  if run == 1 then
    return "biber --quiet " .. name
  else
    return ""
  end
end
