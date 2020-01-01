# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [3.2] - 2020-01-01
### Changed
- 使用 `\ustcsetup` 进行设置
- 目录开启于奇数页

### Added
- 导入 goodfeli/dlbook_notation 的 `math-commands.tex`

## [3.1.06] - 2019-05-01
### Fixed
- 处理 `hyperref` 与 `unicode-math` 的兼容性问题 - [#223](https://github.com/ustctug/ustcthesis/issues/223)

## [3.1.05] - 2019-04-21
### Changed
- 使用 XITS Math 作为数学字体

## [3.1.04] - 2019-03-21
### Fixed
- 禁止扩大段间距 - [#209](https://github.com/ustctug/ustcthesis/issues/209)
- 修正图表标题与正文之间的距离

## [3.1.03] - 2019-01-01
### Fixed
- 修正英文模式下的 Unicode 引号字体 - [CTeX-org/ctex-kit#309](https://github.com/CTeX-org/ctex-kit/issues/389)
- 修正算法的格式
- 修正图表清单的格式

## [3.1.02] - 2018-10-30
### Changed
- 取消依赖 `hyperref`

### Added
- 支持 `siunix` 宏包
- 支持 `nomencl` 宏包

### Fixed
- 修正 macOS 的伪粗黑体

## [3.1.01] - 2018-10-06
### Changed
- 调整伪粗体的粗细程度
- 同步 `xits` 字体文件名的修改
- 取消依赖 `etoolbox`

### Fixed
- 修正 Windows 上“找不到 Courier New”
- 更正章节标题的行距

## [3.1] - 2018-09-01
### Changed
- 使用 `unicode-math` 处理数学字体
- 优化了浮动体放置策略的默认参数

### Fixed
- 更正封面的校名
- 更正了数学符号以满足国标要求
- 更正 subsubsection 的前后距离
- 修复列表中各项之间过大的间距

## [3.0.b] - 2018-05-18
### Fixed
- 更正符号说明的字号
- 更正研究生的目录为另面起
- 更正本科生参考文献的字号

## [3.0.a] - 2018-05-16
### Fixed
- 更正本科生英文模板的章节格式
- 更正图表的注释格式

## [3.0.9] - 2018-05-04
### Changed
- 调整 subsubsection 的缩进
- 参考文献不再著录“出版地不详”等信息

## [3.0.8] - 2018-04-21
### Fixed
- 更正 subsection 的格式

## [3.0.7] - 2018-04-18
### Added
- 参考文献允许著录多个 DOI

### Fixed
- 更正页眉英文大写的错误
- 更正本科生 subsection 的缩进

## [3.0.6] - 2018-04-12
### Changed
- 取消使用微软雅黑

### Fixed
- 修正文献引用之间的连接号为 hyphen
- 修正参考文献页码的连接号为 hyphen

## [3.0.5] - 2018-04-11
### Fixed
- 更正“专业学位类型"的字体
- 专业学位的封面更正为“专业领域”

## [3.0.4] - 2018-03-30
### Fixed
- 脚注按页计数

## [3.0.3] - 2018-03-29
### Fixed
- 顺序编码制连续两个文献引用之间使用连接号

## [3.0.2] - 2018-03-16
### Changed
- 著者-出版年式文献引用不再排序

### Fixed
- 更正本科生的页码
- 更正参考文献姓名的“others”

## [3.0.1] - 2017-12-12
### Fixed
- 更正范数命令失效的错误
- 更正 paragraph 的前后距离


## [3.0] - 2017-07-01
### Added
- 页码居中
- 脚注线长度为版心宽度四分之一
- 脚注用带圈序号，缩进两字
- 符号说明不加页码
- 章题为两字时中间空两字，三字时空一字，四字时空半字，四字以上不空
- 空白页不加页眉
- 正文新的一章另面起
- 更正了 LaTeX 的大于等于号
- 新增二级以下节标题的缩进
- 摘要关键词间隔符号改用分号
- 摘要不再加入目录
- 图表的编号、标题加粗
- 参考文献列表不出现“[S.l.]: [s.n.]”
- 允许文献序号作为叙述文字的一部分
- 优化图注、算法的行距
- 二级以下节标题编号下采用“1.”、“(1)”、“①”

[Unreleased]: https://github.com/ustctug/ustcthesis/compare/v3.2...HEAD
[3.1.06]: https://github.com/ustctug/ustcthesis/compare/v3.2...v3.1.06
[3.1.06]: https://github.com/ustctug/ustcthesis/compare/v3.1.05...v3.1.06
[3.1.05]: https://github.com/ustctug/ustcthesis/compare/v3.1.04...v3.1.05
[3.1.04]: https://github.com/ustctug/ustcthesis/compare/v3.1.03...v3.1.04
[3.1.03]: https://github.com/ustctug/ustcthesis/compare/v3.1.02...v3.1.03
[3.1.02]: https://github.com/ustctug/ustcthesis/compare/v3.1.01...v3.1.02
[3.1.01]: https://github.com/ustctug/ustcthesis/compare/v3.1...v3.1.01
[3.1]: https://github.com/ustctug/ustcthesis/compare/v3.0.b...v3.1
[3.0.b]: https://github.com/ustctug/ustcthesis/compare/v3.0.a...v3.0.b
[3.0.a]: https://github.com/ustctug/ustcthesis/compare/v3.0.9...v3.0.a
[3.0.9]: https://github.com/ustctug/ustcthesis/compare/v3.0.8...v3.0.9
[3.0.8]: https://github.com/ustctug/ustcthesis/compare/v3.0.7...v3.0.8
[3.0.7]: https://github.com/ustctug/ustcthesis/compare/v3.0.6...v3.0.7
[3.0.6]: https://github.com/ustctug/ustcthesis/compare/v3.0.5...v3.0.6
[3.0.5]: https://github.com/ustctug/ustcthesis/compare/v3.0.4...v3.0.5
[3.0.4]: https://github.com/ustctug/ustcthesis/compare/v3.0.3...v3.0.4
[3.0.3]: https://github.com/ustctug/ustcthesis/compare/v3.0.2...v3.0.3
[3.0.2]: https://github.com/ustctug/ustcthesis/compare/v3.0.1...v3.0.2
[3.0.1]: https://github.com/ustctug/ustcthesis/compare/v3.0...v3.0.1
[3.0]: https://github.com/ustctug/ustcthesis/releases/tag/v3.0
