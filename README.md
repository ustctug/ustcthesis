# USTC Thesis

[![Travis Building](https://travis-ci.org/ustctug/ustcthesis.svg?branch=master)](https://travis-ci.org/ustctug/ustcthesis)
[![GitHub release](https://img.shields.io/github/release/ustctug/ustcthesis.svg)](https://github.com/ustctug/ustcthesis/releases/latest)
[![Github All Releases](https://img.shields.io/github/downloads/ustctug/ustcthesis/total.svg)](https://github.com/ustctug/ustcthesis/releases)
[![GitHub commits](https://img.shields.io/github/commits-since/ustctug/ustcthesis/v2.2.4.svg)](https://github.com/ustctug/ustcthesis/commits/master)

本项目是中国科学技术大学的毕业论文 LaTeX 模板 ustcthesis v2.2.4。

新模板进行了彻底的重写，相对于旧版
[ywgATustcbbs/ustcthesis](https://github.com/ywgATustcbbs/ustcthesis)
有以下主要特性：

* 与最新的 TeX Live 和 ctex 2.x 宏包兼容
* 根据操作系统自动配置字体（Windows, Mac OS X, Ubuntu）
* 设置了符合规范的参考文献的格式（支持 author-year 和 numerical 两种格式）
* 修正了字号的设置错误
* 修正了本科生的页码位置
* 提供了更详细的文档

使用前请注意：

1. **使用模板前应阅读[说明文档 `ustcthesis.pdf`](https://git.ustclug.org/ustctug/ustcthesis/uploads/ddfd447fc6b125bd628051916e209a33/ustcthesis.pdf) 的正文部分**
2. **本模板仅适用于最新版 [TeX Live](https://www.tug.org/texlive/) 、 [MacTeX](https://www.tug.org/mactex/) 、 [MikTeX](http://www.miktex.org/)，不对旧版本向下兼容**
3. 应使用 `tlmgr` 将各个宏包升级到最新
4. **[CTeX套装](http://www.ctex.org/CTeXDownload) v2.9.2.164 发布于2012年，无法使用此模板，用户请使用旧模板**


## 下载地址

* GitHub Release：https://github.com/ustctug/ustcthesis/releases
* 校内镜像：https://git.ustclug.org/ustctug/ustcthesis/tags


## 使用说明

### 通用使用说明

1. 下载模板。有三种方式可以选择：

   1. 可以直接下载发布版，发布版的特点在于稳定且经过测试，但更新不够及时，已知BUG无法及时修复
   2. 可以直接点击“Download ZIP”下载最新的开发版，开发版的特点在于更新及时，随时修复已知BUG
   3. git用户可以直接clone开发版的源码

      ```
      git clone https://github.com/ustctug/ustcthesis.git
      ```

2. 编译生成模板的说明文档 `ustcthesis.pdf` ，并仔细阅读正文部分对模板使用的介绍

   ```
   latexmk ustcthesis.dtx       # 编译生成 ustcthesis.pdf
   latexmk -c ustcthesis.dtx    # 清理编译过程中的临时文件
   ```

3. 参考示例文档 `main.tex` 写自己的论文，使用如下命令生成论文 `main.pdf`：

   ```
   latexmk
   ```

   如需清理论文生成过程中的临时文件，可以用命令：

   ```
   latexmk -c
   ```

   修改论文的过程中，需要经常重复此步骤。

### Linux/Mac用户使用说明

模板为Linux/Mac用户提供了Makefile文件，可以用如下 `make` 命令替换通用使用说明中的一些命令：

```
make doc        # 编译生成 ustcthesis.pdf
make            # 编译生成论文 main.pdf
make clean      # 删除编译过程中生成的临时文件
make distclean   # 删除编译过程中生成的临时文件以及生成的PDF
```

### Windows用户使用说明

Windows用户请参照通用使用说明，暂不提供Windows下的bat脚本。


## 参考规范：
* [《中国科学技术大学研究生学位论文撰写规范》](http://gradschool.ustc.edu.cn/ylb/material/xw/wdxz/1.doc)
* [《关于本科毕业论文（设计）格式和统一封面的通知》](http://www.teach.ustc.edu.cn/document/doc-administration/4032.html)
