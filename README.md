# USTCThesis-Rework

USTCThesis-Rework 是 ustcthesis v2.0 的开发项目。

原项目 [ywgATustcbbs/ustcthesis](https://github.com/ywgATustcbbs/ustcthesis) 存在一些细节与学校要求不符，并且有一些历史遗留问题，所以进行重写。



## 如何构建

USTCThesis-Rework要求使用 TeX Live 2015 发行版，并且尽可能升级到最新，尤其依赖于 ctex 2.0 以及更高版本。

本项目提供了 Makefile，如果你有 GNU Make，直接用命令
```
make
```
进行构建，也可以使用命令
```
latexmk -xelatex main.tex
```



## 已知问题
[已知问题汇总 issue #8](https://github.com/USTCThesis/USTCThesis-Rework/issues/8)
