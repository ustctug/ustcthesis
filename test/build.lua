#!/usr/bin/env texlua

module = "ustcthesis"

testfiledir = "./test/testfiles"

demofiles = {"main.tex", "bib", "chapters"}
installfiles = {"*.cls", "figures"}
sourcefiles = {"*.dtx", "figures"}
unpackfiles = {"ustcthesis.dtx"}

checkengines = {"xetex"}
stdengine = "xetex"

typesetexe = "xelatex"
unpackexe = "xetex"

checkopts = "-file-line-error -halt-on-error -interaction=nonstopmode"
typesetopts = "-file-line-error -halt-on-error -interaction=nonstopmode"

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
