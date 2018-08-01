#!/usr/bin/env texlua

module = "ustcthesis"

demofiles = {"main.tex", "ustcthesis-extra.sty", "bib", "chapters"}
installfiles = {"*.cls", "figures"}
sourcefiles = {"*.dtx", "figures"}
unpackfiles = {"ustcthesis.dtx"}

checkengines = {"xetex"}
stdengine = "xetex"

typesetexe = "xelatex"
unpackexe = "xetex"

checkopts = "-file-line-error -halt-on-error -interaction=nonstopmode"
typesetopts = "-file-line-error -halt-on-error -interaction=nonstopmode"

checkruns = 2

-- function runtest_tasks(name)
--     return "bibtex " .. name
-- end

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
