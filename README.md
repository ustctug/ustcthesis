# 中国科学技术大学学位论文 LaTeX 模板

[![GitHub release](https://img.shields.io/github/release/ustctug/ustcthesis/all.svg)](https://github.com/ustctug/ustcthesis/releases/latest)
[![GitHub commits](https://img.shields.io/github/commits-since/ustctug/ustcthesis/latest.svg)](https://github.com/ustctug/ustcthesis/commits/master)
[![Build](https://github.com/ustctug/ustcthesis/workflows/build/badge.svg)](https://github.com/ustctug/ustcthesis/actions)

本项目是中国科学技术大学的学位论文 LaTeX 模板 ustcthesis，按照最新版的
《[研究生学位论文撰写手册](http://gradschool.ustc.edu.cn/ylb/material/xw/wdxz/32.pdf)》
和
《[关于本科毕业论文（设计）格式和统一封面的通知](http://www.teach.ustc.edu.cn/document/doc-administration/4032.html)》
的要求编写，兼容最新版的 TeX Live、MacTeX 、MiKTeX 发行版，支持跨平台使用。

注意：

1. 使用说明文档
[ustcthesis.pdf](https://github.com/ustctug/ustcthesis/releases/download/v3.0/ustcthesis.pdf)
在发布版中附带，用户也可自行编译；**使用模板前应仔细阅读**。

2. 本模板要求 TeX Live、MacTeX、MiKTeX 不低于 2017 年的发行版，
并且尽可能升级到最新。安装和升级方法见
[新手指南](https://github.com/ustctug/ustcthesis/wiki/新手指南)。

3. **不支持** [CTeX 套装](http://www.ctex.org/CTeXDownload)。
（[为什么？](https://github.com/ustctug/ustcthesis/wiki/常见问题#3-模板支持用-ctex-套装编译吗)）


## 下载地址

- GitHub Releases：https://github.com/ustctug/ustcthesis/releases

- 校内镜像：https://git.lug.ustc.edu.cn/ustctug/ustcthesis

- 研究生院网站（版本较旧，不推荐）：http://gradschool.ustc.edu.cn/ylb/xw.html


## 编译文档

- 编译模板的使用说明文档 `ustcthesis.pdf`：
   ```
   latexmk -xelatex ustcthesis.dtx
   ```
- 编译论文 `main.pdf`：
   ```
   latexmk -xelatex main.tex
   ```
- 如需清理论文编译过程中的临时文件，可以：
   ```
   latexmk -c
   ```

- 以上编译过程也可以用 `make` 工具：
   ```
   make doc        # 编译生成 ustcthesis.pdf
   make            # 编译生成论文 main.pdf
   make clean      # 删除编译过程中生成的临时文件
   ```

## 反馈问题

如果发现模板有问题，请按照以下步骤操作：

1. 阅读学校的标准，判断是否符合学校的要求；
2. 阅读 [常见问题 FAQ](https://github.com/ustctug/ustcthesis/wiki/常见问题)；
3. 将 TeX 发行版和宏包升级到最新，并且将模板升级到 Github 上最新版本，
查看问题是否已经修复；
4. 在 [GitHub Issues](https://github.com/ustctug/ustcthesis/issues)
中搜索该问题的关键词；
5. 在 [GitHub Issues](https://github.com/ustctug/ustcthesis/issues)
中提出新 issue，并回答以下问题：
    - 使用了什么版本的 TeX Live / MacTeX / MiKTeX ？
    - 具体的问题是什么？
    - 正确的结果应该是什么样的？
    - 是否应该附上相关源码或者截图？

如果导师或者院系在格式上有额外的要求，请将老师的邮件转发给模板作者。
作者会考虑增加接口以便修改格式。


## 更多资料

- [LaTeX 新手入门指南](https://github.com/ustctug/ustcthesis/wiki/新手指南)
- [常见问题 FAQ](https://github.com/ustctug/ustcthesis/wiki/常见问题)
- [参与开发](https://github.com/ustctug/ustcthesis/wiki/参与开发)
