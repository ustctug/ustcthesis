#!/usr/bin/env texlua

module = "ustcthesis"

testfiledir = "./test/testfiles"
testsuppdir = "./test/support"

demofiles = {"main.tex", "bib", "chapters"}
installfiles = {"*.cls", "*.bst", "*.bbx", "*.cbx", "figures"}
sourcefiles = {"*.cls", "*.bst", "*.bbx", "*.cbx", "figures"}
tagfiles = {"*.cls", "ustcthesis-doc.tex", "CHANGELOG.md", "main.tex"}

checkengines = {"xetex"}
stdengine = "xetex"

checkconfigs = {
    "build",
    "test/config-crossref",
    "test/config-nomencl",
    "test/config-bibtex",
    "test/config-biblatex",
}

typesetexe = "xelatex"
unpackexe = "xetex"

checkopts = "-file-line-error -halt-on-error -interaction=nonstopmode"
typesetopts = "-file-line-error -halt-on-error -interaction=nonstopmode"

lvtext = ".tex"

function update_tag(file, content, tagname, tagdate)
  tagname = string.gsub(tagname, "^v", "")
  local url = "https://github.com/ustctug/ustcthesis"
  local date = string.gsub(tagdate, "%-", "/")

  if string.match(file, "%.cls$") then
    content = string.gsub(content, "\\newcommand\\ustcthesisversion{[0-9.]+",
      "\\newcommand\\ustcthesisversion{" .. tagname)

    content = string.gsub(content, "\\ProvidesClass{ustcthesis}%[%d%d%d%d/%d%d/%d%d",
      "\\ProvidesClass{ustcthesis}[" .. date)

  elseif string.match(file, "%-doc.tex") then
    content = string.gsub(content, "v[0-9.]+\\qquad %d%d%d%d%-%d%d%-%d%d",
      "v" .. tagname .. "\\qquad " .. tagdate)

  elseif string.match(file, "CHANGELOG.md") then
    local previous = string.match(content, "/compare/v(.*)%.%.%.HEAD")
    print(previous)
    if tagname == previous then return content end
    content = string.gsub(content,
      "## %[Unreleased%]",
      "## [Unreleased]\n\n## [" .. tagname .."] - " .. tagdate)
    content = string.gsub(content,
      previous .. "%.%.%.HEAD",
      tagname .. "...HEAD\n[" .. tagname .. "]: " .. url .. "/compare/v"
        .. previous .. "...v" .. tagname)
  end
  return content
end
