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

excludetests = {
  "font-windows",
  "font-mac",
}

lvtext = ".tex"

function update_tag(file, content, tagname, tagdate)
  tagname = string.gsub(tagname, "^v", "")
  local url = "https://github.com/ustctug/ustcthesis"

  content = string.gsub(content,
    "Copyright %(C%) (%d%d%d%d)%-%d%d%d%d",
    "Copyright (C) %1-" .. os.date("%Y"))

  if string.match(file, "%.cls$") then
    content = string.gsub(content, "\\newcommand\\ustcthesisversion{[0-9a-z.-]+",
      "\\newcommand\\ustcthesisversion{" .. tagname)

    content = string.gsub(content, "\\ProvidesExplClass{ustcthesis}{%d%d%d%d%-%d%d%-%d%d",
      "\\ProvidesExplClass{ustcthesis}{" .. tagdate)

  elseif string.match(file, "%-doc.tex") then
    content = string.gsub(content, "v[0-9a-z.-]+\\qquad %d%d%d%d%-%d%d%-%d%d",
      "v" .. tagname .. "\\qquad " .. tagdate)

  elseif string.match(file, "CHANGELOG.md") then
    local previous = string.match(content, "/compare/v([0-9a-z.-]+)%.%.%.HEAD")
    if tagname == previous then return content end
    content = string.gsub(content,
      "## %[Unreleased%]",
      "## [Unreleased]\n\n## [" .. tagname .. "] - " .. tagdate)

    content = string.gsub(content,
      previous:gsub("%.", "%%."):gsub("%-", "%%-") .. "%.%.%.HEAD",
      tagname .. "...HEAD\n[" .. tagname .. "]: " .. url .. "/compare/v"
      .. previous .. "...v" .. tagname)
  end
  return content
end
