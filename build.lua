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
  local url = "https://github.com/ustctug/ustcthesis"
  local date = string.gsub(tagdate, "%-", "/")

  if string.match(file, "%.cls$") then
    if string.match(content, "\\newcommand\\ustcthesisversion{v[0-9.]+}") then
      content = string.gsub(content, "\\newcommand\\ustcthesisversion{v[0-9.]+",
      "\\newcommand\\ustcthesisversion{" .. tagname)
    end

    if string.match(content, "\\ProvidesClass{ustcthesis}%[%d%d%d%d/%d%d/%d%d") then
      content = string.gsub(content, "\\ProvidesClass{ustcthesis}%[%d%d%d%d/%d%d/%d%d",
        "\\ProvidesClass{ustcthesis}[" .. date)
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
