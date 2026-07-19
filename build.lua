#!/usr/bin/env texlua
---@diagnostic disable: lowercase-global

-- Configuration file for use with "l3build"

module = "ustcthesis"

testfiledir = "./tests/testfiles"
testsuppdir = "./tests/support"

demofiles = {"main.tex", "bib", "chapters"}
installfiles = {"*.cls", "*.bst", "*.bbx", "*.cbx", "figures"}
sourcefiles = {"*.cls", "*.bst", "*.bbx", "*.cbx", "figures"}
tagfiles = {"*.cls", "ustcthesis-doc.tex", "CHANGELOG.md", "main.tex"}

checkengines = {"xetex"}
stdengine = "xetex"

checkconfigs = {
  "build",
  "tests/config-crossref",
  "tests/config-nomencl",
  "tests/config-bibtex",
  "tests/config-biblatex",
}

typesetexe = "xelatex"
unpackexe = "xetex"

checkopts = "-file-line-error -interaction=nonstopmode"
typesetopts = "-file-line-error -interaction=nonstopmode"

local package_repository = "https://github.com/ustctug/ustcthesis"
local version_pattern = "[%d.]+[%l%d.-]*"

function update_tag(file, content, tagname, tagdate)
  local version = string.gsub(tagname, "^v", "")
  local date = string.gsub(tagdate, "%-", "/")

  content = string.gsub(content,
    "Copyright %(Cc%) (%d%d%d%d)%-+%d%d%d%d",
    "Copyright (C) %1-" .. os.date("%Y"))

  if file == "CHANGELOG.md" then
    local previous = string.match(content, "compare/v(" .. version_pattern .. ")%.%.%.HEAD")
    if version ~= previous then
      content = string.gsub(content,
        "## %[Unreleased%]",
        "## [Unreleased]\n\n## [" .. version .. "] - " .. tagdate)
      content = string.gsub(content,
        "v" .. version_pattern .. "%.%.%.HEAD",
        "v" .. version .. "...HEAD\n[" .. version .. "]: " .. package_repository .. "/compare/v" .. previous
        .. "...v" .. version)
    end

  elseif string.match(file, "%.cls$") then
    content = string.gsub(content, "\\newcommand\\ustcthesisversion{" .. version_pattern,
      "\\newcommand\\ustcthesisversion{" .. version)

    content = string.gsub(content, "\\ProvidesClass{ustcthesis}%[%d%d%d%d/%d%d/%d%d",
      "\\ProvidesClass{ustcthesis}[" .. date)

  elseif string.match(file, "%-doc.tex$") then
    content = string.gsub(content, "v" .. version_pattern .. "\\qquad %d%d%d%d%-%d%d%-%d%d",
      "v" .. version .. "\\qquad " .. tagdate)

  end
  return content
end
