#!/usr/bin/env texlua

module = "ustcthesis"

testfiledir = "./test/testfiles"
testsuppdir = testfiledir .. "/support"

demofiles = {"main.tex", "bib", "chapters"}
installfiles = {"*.cls", "*.bst", "figures"}
sourcefiles = {"*.cls", "*.bst", "figures"}
tagfiles = {"*.cls", "ustcthesis-doc.tex", "CHANGELOG.md", "main.tex"}

checkengines = {"xetex"}
stdengine = "xetex"

checkconfigs = {
    "build", "test/config-toc", "test/config-nomencl",
    "test/config-bib",
}

typesetexe = "xelatex"
unpackexe = "xetex"

checkopts = "-file-line-error -halt-on-error -interaction=nonstopmode"
typesetopts = "-file-line-error -halt-on-error -interaction=nonstopmode"

lvtext = ".tex"

function update_tag(file, content, tagname, tagdate)
  local iso = "%d%d%d%d%-%d%d%-%d%d"
  local url = "https://github.com/ustctug/ustcthesis"
  local date = string.gsub(tagdate, "%-", "/")
  if string.match(file, "%.cls$") then
    if string.match(content, "\\ProvidesClass{ustcthesis}%[%d%d%d%d/%d%d/%d%d v[0-9.]+") then
      content = string.gsub(content, "%d%d%d%d/%d%d/%d%d v[0-9.]+",
        date .. " " .. tagname)
    end

  elseif string.match(file, "%-doc.tex") then
    if string.match(content, "\\date{v[0-9.]+\\qquad %d%d%d%d%-%d%d%-%d%d}") then
      content = string.gsub(content, "v[0-9.]+\\qquad %d%d%d%d%-%d%d%-%d%d",
        tagname .. "\\qquad " .. tagdate)
    end

  elseif string.match(file, "CHANGELOG.md") then
    local previous = string.match(content, "/compare/(.*)%.%.%.HEAD")

    if tagname == previous then return content end
    content = string.gsub(content,
      "## %[Unreleased%]",
      "## [Unreleased]\n\n## [" .. tagname .."] - " .. tagdate)
    content = string.gsub(content,
      previous .. "%.%.%.HEAD",
      tagname .. "...HEAD\n[" .. tagname .. "]: " .. url .. "/compare/"
        .. previous .. "..." .. tagname)
  end
  return content
end
