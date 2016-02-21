# USTC Thesis

本项目是中国科学技术大学的毕业论文 LaTeX 模板 ustcthesis v2.0。

新模板进行了彻底的重写，相对于旧版
[ywgATustcbbs/ustcthesis](https://github.com/ywgATustcbbs/ustcthesis)
有以下主要特性：

* 与最新的 TeX Live 2015 和 ctex 2.x 宏包兼容
* 根据操作系统自动配置字体（Windows, Mac OS X, Ubuntu）
* 设置了符合规范的参考文献的格式
* 修正了字号的设置错误
* 修正了本科生的页码位置
* 提供了更详细的文档

**使用模板前应阅读说明文档 `ustcthesis.pdf` 的正文部分。**

**本模板基于 TeX Live 2015 及以上版本，不对旧版本向下兼容。**
旧版 TeX Live / MacTeX / MikTeX 用户应升级到最新；CTeX 发行版（已经 3 年没有更新）用户请移步旧版。

## 下载地址

发布版包含了 PDF 说明文档：

* GitHub Release：https://github.com/ustctug/ustcthesis/releases
* 校内镜像：https://git.ustclug.org/ustctug/ustcthesis/tags



## 编译论文

最简单的方法是使用 `latexmk` 工具（已配置参数 `-xelatex`），如编译论文 `main.pdf` 使用命令：
```
$ latexmk
```
编译说明文档 `ustcthesis.pdf` 使用命令：
```
$ latexmk ustcthesis.dtx
```
更多的方法参见说明文档。



## 已知问题

- [ ] 暂不支持英文风格
- [ ] 参考文献格式不支持 author-year 式


## 参考规范：
* [《中国科学技术大学研究生学位论文撰写规范》](http://gradschool.ustc.edu.cn/ylb/material/xw/wdxz/1.doc)
* [《关于本科毕业论文（设计）格式和统一封面的通知》](http://www.teach.ustc.edu.cn/document/doc-administration/4032.html)
