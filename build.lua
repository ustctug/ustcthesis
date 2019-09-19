#!/usr/bin/env texlua

module = "ustcthesis"

testfiledir = "./test/testfiles"
testsuppdir = testfiledir .. "/support"

demofiles = {"main.tex", "bib", "chapters"}
installfiles = {"*.cls", "*.bst", "figures"}
sourcefiles = {"*.dtx", "*.bst", "figures"}
unpackfiles = {"ustcthesis.dtx"}

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
