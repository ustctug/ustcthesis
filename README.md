# USTCThesis-Rework

USTCThesis-Rework 是 ustcthesis v2.0 的开发项目。

原项目 [ywgATustcbbs/ustcthesis](https://github.com/ywgATustcbbs/ustcthesis) 存在一些细节与学校要求不符，并且有一些历史遗留问题，所以进行重写。



## 已知问题

- [ ] 密级
- [ ] 其他语种的封面
- [ ] 目录的书签
- [ ] 图、表的书签
- [ ] 符号对照表
- [ ] 参考文献及其标签
- [ ] 致谢的书签
- [ ] 书脊

- [ ] 目录缩进的字符宽度由字体决定
- [ ] 脚注的编号？
- [ ] 空白页不显示页码？
- [ ] 图和表的题注
- [ ] longtable
- [ ] 页码位置
- [ ] 中英文论文标题未加粗
- [ ] 英文标题行距
- [ ] 作者姓名没有距离左边界6cm
- [ ] 英文作者姓名，不是严格30磅
- [ ] 行距问题待确认
- [ ] abstract未使用Arial字体, abstract全大写
- [ ] 目录中段前段后的设置
- [ ] table caption aboveskip=belowskip?
- [ ] 公式编号的字号为10.5磅

- [ ] 本科论文要求从目录开始编号

- [ ] Times New Roman 的数学字体
- [ ] “作者姓名” 粗度


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
