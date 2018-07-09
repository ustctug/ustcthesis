### 要参与 LaTeX 模板的开发，首先要熟悉面向用户的命令和工具，除了 lshort，还应熟悉：

- latex2e: 系统地介绍了 LATEX 使用的方方面面的文档，有平时很多用不到但是 LATEX 提供了的命令

- 所用宏包的文档(可能还有源码):

- 常用的工具 latexmk, texdoc

- 一些调试技巧如 `\show` 和 `\meaning` 命令


### 下面是面向开发的文档：

- clsguide: 给 LaTaX2e 宏包作者的指南

- fntguide, fontspec 字体的设置

- classes: 三个标准文档类 article, book, report 的实现

- source2e: LaTaX2e 的源码

- macros2e: 集中介绍了 LaTaX2e 里使用的一些内部宏，用于参考

- dtxtut: LaTeX 的宏包与说明文档的封装方式，更详细的有 docstrip 和 doc，[Joseph Wright 的文章](http://www.texdev.net/2009/10/06/a-model-dtx-file/) 介绍了更好封装的技巧


### 关于更低层的 TeX 只是，有以下资料:

- TeXbook: Knuth 的 TeX 圣经，了解底层 TeX 的原理必读。还有更简略一点的介绍文档 TeXbyTopic 和 impatient。

- The LaTeX Companion: 一本大而全的书。


### 关于 BibTeX，应阅读以下文档:

- btxdoc, btxhak: BibTeX 的说明文档

- btxbst.doc: BibTeX 的三个标准 bst 的源文件(带注释)

- ttb: 关于 bst 更详细的介绍

- natbib: natbib 宏包的文档

LaTeX3 的开发正在进行中，其底层接又已经相对成熟和稳定。xecjk 和 ctex 均是建立 在 LaTeX3 基础上的。关于 LaTeX3 的语法的文档有:

- l3styleguide: 这是 LaTeX3 项目组写给开发者的指南

- expl3: 这是 LaTeX3 编程接口宏包的文档

- interface3: 这是 LaTeX3 的开发者接口文档

- source3: 这是 LaTeX3 的实现



### 参考：

[开发一个 LaTeX 宏包需要多少知识？ - 知乎](https://www.zhihu.com/question/27017364)

[如何写一个package或者class - 知乎专栏](https://zhuanlan.zhihu.com/p/19705200)


### 一些高质量的模板：

- 清华大学 [xueruini/thuthesis](https://github.com/xueruini/thuthesis)

- 中国科学院大学 [mohuangrui/ucasthesis](https://github.com/mohuangrui/ucasthesis)

- 复旦大学 [Stone-Zeng/fduthesis](https://github.com/Stone-Zeng/fduthesis)
