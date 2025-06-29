# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed

- 修正 LuaTeX 部分符号错误地使用西文字体（[tuna/thuthesis#1022](https://github.com/tuna/thuthesis/issues/1022)）。
- 修正声明页中错误换行的问题（[#470](https://github.com/ustctug/ustcthesis/issues/470)）。

## [4.0.0-beta.9] - 2025-05-25

### Changed

- 本科生参考文献的期刊题名不再使用斜体（[#457](https://github.com/ustctug/ustcthesis/pull/457)）。
- 页眉距离边界改为 1.5 cm（[#413](https://github.com/ustctug/ustcthesis/issues/413)）。
- 更新参考文献格式。

### Fixed

- 本科生的空白页不显示页码（[#457](https://github.com/ustctug/ustcthesis/pull/458)）。
- 本科生表格、插图标题按照 Word 模板使用 22 pt 行距。
- 本科生表格内容使用 1.5 倍行距。
- 修正“关键词”的格式。
- 修正参考文献表的缩进格式。

## [4.0.0-beta.8] - 2025-04-16

### Changed

- 科研成果列表的序号改为方括号（[#449](https://github.com/ustctug/ustcthesis/issues/449#issuecomment-2804822791)）。
- 更新科研成果列表的缩进（[#449](https://github.com/ustctug/ustcthesis/issues/449#issuecomment-2804870730)）。

### Fixed

- 修正中文摘要的关键词和分隔符（[#449](https://github.com/ustctug/ustcthesis/issues/449)、[#450](https://github.com/ustctug/ustcthesis/issues/450)）。
- 修正插图和附表清单的标签（[#449](https://github.com/ustctug/ustcthesis/issues/449)）。

## [4.0.0-beta.7] - 2025-04-07

### Added

- 新增 `eqn-paren-style` 控制中文数学公式的编号（`\eqref`）使用全角或半角括号（[#420](https://github.com/ustctug/ustcthesis/issues/420)）。
- 添加博士学位论文的“创新性说明”环境 `innovations`（研究生院 2025-02-27 Word 模板，[#423](https://github.com/ustctug/ustcthesis/issues/423)）。
- 添加 `degree-type = engineering` 工程学位类型（[#427](https://github.com/ustctug/ustcthesis/issues/427)）。

### Changed

- 中文数学公式的编号（`\eqref`）默认使用全角括号（[#420](https://github.com/ustctug/ustcthesis/issues/420)）。
- 封面的横向页边距改为 3.17 cm（[#424](https://github.com/ustctug/ustcthesis/issues/424)）。
- 更新封面的格式（[#438](https://github.com/ustctug/ustcthesis/issues/438)）。
- 更新原创性和授权使用声明的格式。
- 数学式的改为段前6磅、段后6磅（研究生院 2025-03-12 Word 模板）。
- 图表标题的对齐方式改为 `centerlast`（两端对齐、末行居中）（[#442](https://github.com/ustctug/ustcthesis/issues/442)）。
- 英文摘要改为悬挂缩进 2 em（研究生院 2025-03-12 Word 模板）。
- 英文关键词改为悬挂缩进 6.5 em（研究生院 2025-03-12 Word 模板）。

### Fixed

- 修正复数 Practice supervisors 的拼写（[#431](https://github.com/ustctug/ustcthesis/pull/431)）。
- 修正英文摘要的缩进为 1 em（[#434](https://github.com/ustctug/ustcthesis/pull/434)）。
- 修正图注和表注格式。

### Removed

- 移除封面的“专业/工程学位类型”（[#427](https://github.com/ustctug/ustcthesis/issues/427#issuecomment-2714402725)）。
- 移除研究生的三级以下节标题的设置（[#445](https://github.com/ustctug/ustcthesis/issues/445)）。

## [4.0.0-beta.6] - 2025-02-25

### Changed

- 调整页眉距边界 2.0 cm（研究生院 2024-12-05 Word 模板修改，[#411](https://github.com/ustctug/ustcthesis/issues/411#issuecomment-2652543582)）。
- 空白页添加页码（研究生院 2024-12-05 Word 模板修改，[#390](https://github.com/ustctug/ustcthesis/issues/390#issuecomment-2652974038)）。
- 修改符号说明的页脚样式（研究生院 2024-12-05 Word 模板修改，[#411](https://github.com/ustctug/ustcthesis/issues/411#issuecomment-2656237617)）。
- 图注较短时居中（[#414](https://github.com/ustctug/ustcthesis/issues/414)）。
- 修改章节标题的格式（研究生院 2024-12-05 Word 模板修改，[#411](https://github.com/ustctug/ustcthesis/issues/390#issuecomment-2677732743)）。

## [4.0.0-beta.5] - 2025-02-10

### Fixed

- 修正英文摘要标题“ABSTRACT”的粗体（[#411](https://github.com/ustctug/ustcthesis/issues/411#issuecomment-2577181494)）。
- 修正中文封面的“企业导师”（[#411](https://github.com/ustctug/ustcthesis/issues/390#issuecomment-2646114373)）。

## [4.0.0-beta.4] - 2025-01-05

### Added

- 新增科研成果列表环境 `theachievements`。
- 新增图注命令 `\figurenote`。

### Changed

- 章标题取消加粗（研究生院 2024-12-05 Word 模板修改，[#411](https://github.com/ustctug/ustcthesis/issues/411)）。
- 调整科研成果示例（研究生院 2024-12-05 Word 模板修改，[#411](https://github.com/ustctug/ustcthesis/issues/411)）。
- 更新专业硕士论文封面：“专业领域”改为“学科专业”，“Advisor”改为“Practice supervisor”（研究生院 2024-12-05 Word 模板修改，[#390](https://github.com/ustctug/ustcthesis/issues/390#issuecomment-2558042581)）。
- 图表的标题字号改为 11pt（研究生院 2024-12-05 Word 模板修改）。
- 表题改为宋体（研究生院 2024-12-05 Word 模板修改）。
- 图注、表注字号改为 11pt（研究生院 2024-12-05 Word 模板修改）。
- 调整插图、表格与文字的间距（研究生院 2024-12-05 Word 模板修改）。
- 修改表单元格中的字号和行距（研究生院 2024-12-05 Word 模板修改）。

### Deprecated

- 图注、表注命令 `\note` 已经过时，改为使用 `\figurenote` 或 `\tablenote` 命令。

## [4.0.0-beta.3] - 2024-12-15

### Added

- 新增“插图和附表清单” `\listoffiguresandtables`（研究生院 2024-12-05 Word 模板修改）。

### Changed

- 英文封面的“Finished time”改为“Completion date”（研究生院 2024-12-05 Word 模板修改，[#390](https://github.com/ustctug/ustcthesis/issues/390#issuecomment-2532580113)）。
- 英文摘要的“Key Words”改为大写“KEY WORDS”（研究生院 2024-12-05 Word 模板修改，[#390](https://github.com/ustctug/ustcthesis/issues/390#issuecomment-2532580113)）。
- 章标题较短时（四字以下）不再空字（研究生院 2024-12-05 Word 模板修改，[#390](https://github.com/ustctug/ustcthesis/issues/390#issuecomment-2532580113)）。
- “在读期间发表的学术论文与取得的研究成果”改为“在读期间取得的科研成果”（研究生院 2024-12-05 Word 模板修改，[#390](https://github.com/ustctug/ustcthesis/issues/390#issuecomment-2532580113)）。
- 关键词之间改用分号间隔（研究生院 2024-12-05 Word 模板修改）。
- 英文摘要的页眉改为大写“ABSTRACT”（研究生院 2024-12-05 Word 模板修改）。
- 目录的章标题改为黑体小四号（研究生院 2024-12-05 Word 模板修改）。
- 目录的二级节标题改为宋体（研究生院 2024-12-05 Word 模板修改）。
- 目录的引导线改为句点（研究生院 2024-12-05 Word 模板修改）。
- “表格清单”改为“附表清单”（研究生院 2024-12-05 Word 模板修改）。
- 更新英文封面布局（研究生院 2024-12-05 Word 模板修改）。

## [4.0.0-beta.2] - 2024-11-18

### Changed

- 封面中“导师姓名”改为“导师”（研究生院 2024-10-14 Word 模板修改，[#406](https://github.com/ustctug/ustcthesis/issues/406)）。

## [4.0.0-beta.1] - 2024-10-18

### Changed

- 本科生参考文献改用 GB/T 7714 格式（[zepinglee/gbt7714-bibtex-style#169](https://github.com/zepinglee/gbt7714-bibtex-style/issues/169)）。
- 专业博士的封面改为“工程博士”（研究生院 2024-09-23 Word 模板修改，[#402](https://github.com/ustctug/ustcthesis/issues/402)）。

## [3.3.5] - 2024-05-09

### Changed

- 本科生摘要关键词的分隔符改为分号，同步教务处 2023-05-06 的修改（[#376](https://github.com/ustctug/ustcthesis/issues/376)）。
- 本科生的参考文献格式恢复为 2021 年版，同步教务处 2023-05-06 的修改（[#376](https://github.com/ustctug/ustcthesis/issues/376)）。
- 二级节标题不再缩进（研究生院 2024-03-01 Word 模板）。
- 标题的编号使用 Times New Roman 字体（研究生院 2024-03-01 Word 模板）。

## [3.3.4] - 2023-05-10

### Changed

- 本科生的正文不再另页右页（`\cleardoublepage`）。
- 去掉本科生空白页的页码。
- 目录的引导线更加稠密。
- 更新本科生扉页（内封）格式，同步教务处 2023-05-08 版《[中国科学技术大学本科毕业论文（设计）扉页（内封）](https://www.teach.ustc.edu.cn/?attachment_id=15889)》（[#374](https://github.com/ustctug/ustcthesis/issues/374)）。

## [3.3.3] - 2022-05-17

### Added

- 新增选项 `reviewer` 选择是否在声明页显示“评审专家签名”（[#334](https://github.com/ustctug/ustcthesis/issues/334)）。

### Changed

- 更新 2022 年 3 月版本科生的参考文献格式（[#346](https://github.com/ustctug/ustcthesis/issues/346)）。
- 研究生的关键词分隔符为空一字和“, ”。

### Fixed

- 修正 `biblatex` 的参考文献表中期刊名的大小写（[#338](https://github.com/ustctug/ustcthesis/issues/338)）。
- 消除本科生封面的 overfull box 警告（[#345](https://github.com/ustctug/ustcthesis/issues/345)）。
- 修正本科生的关键词分隔符为“、”和“, ”（[#354](https://github.com/ustctug/ustcthesis/issues/354)）。

## [3.3.2] - 2022-03-25

### Added

- 新增选项 `math-font = cm` (Computer Modern)（[#324](https://github.com/ustctug/ustcthesis/issues/324)）。
- 新增 LuaLaTeX 支持（虽然很慢）。

### Changed

- 专业学位类型 `professional-type` 为空时不再显示括号（[#325](https://github.com/ustctug/ustcthesis/issues/325)）。
- 本科生的英文摘要标题改为小二号“ABSTRACT”（2021 年 11 月新版，[#332](https://github.com/ustctug/ustcthesis/issues/332)）。
- 本科生的目录中去掉摘要（2021 年 11 月新版）。
- 调整本科生的章节顺序（2021 年 11 月新版）。
- 本科生的目录中加入致谢（2021 年 11 月新版）。
- 本科生致谢的末尾增加日期（2021 年 11 月新版）。

### Fixed

- 修复了载入 `natbib` 前设置 `cite-style` 无效的问题（[#327](https://github.com/ustctug/ustcthesis/issues/327)）。

## [3.3.1] - 2021-12-10

### Changed

- 同步新版《撰写手册》（2016 年 12 月版，2019 年 第 3 次印刷）（[#291](https://github.com/ustctug/ustcthesis/issues/291)）。
- 本科生的第一章开启于奇数页。
- 按照新版《手册》的要求，目录中的二级标题使用仿宋体 12 磅（[#316](https://github.com/ustctug/ustcthesis/issues/316)）。
- `biblatex` 的参考文献表中题名改为转换成 sentence case（感谢 [@hushidong](https://github.com/hushidong)）（[#315](https://github.com/ustctug/ustcthesis/issues/315)）。
- 本科生的封面改为制本厂的格式（[#301](https://github.com/ustctug/ustcthesis/issues/301)）。
- 参考文献表中预印本的文献类型标识改为“A”。

### Fixed

- 修正了与 `chapterbib` 宏包的兼容性。
- 修正了本科生 PDF 书签中页码的错误（[#293](https://github.com/ustctug/ustcthesis/issues/293)）。
- 修正了表题的字体（[#295](https://github.com/ustctug/ustcthesis/issues/295)）。
- 修正了 `article` 只有 `date` 时年份缺失的问题（[#299](https://github.com/ustctug/ustcthesis/issues/299)）。
- 修正了 biblatex 参考文献的页眉（[#311](https://github.com/ustctug/ustcthesis/issues/311)）。
- 修正授权使用声明中的“保密”为“控阅”（[#314](https://github.com/ustctug/ustcthesis/issues/314)）。
- 修正本科生参考文献的格式。
- 修正了图题的段后距离（[#307](https://github.com/ustctug/ustcthesis/issues/307)）。
- 参考文献表中专利文献使用 `address`/`location` 输出专利国别。

### Removed

- 去掉了 `siunitx` 的 `inter-unit-product` 设置。

## [3.3.0] - 2021-03-18

### Added

- 添加软件工程专业的封面的格式的支持。
- 新增 biblatex 的支持（[#282](https://github.com/ustctug/ustcthesis/issues/282)）。
- 新增数学符号风格选项 `math-style`。
- 新增选项控制数学字体风格的细节：`uppercase-greek`、`less-than-or-equal`、`integral`、`integral-limits`、`partial`、`math-ellipsis` 和 `real-part`。

### Changed

- 同步本科生 2020 年版规定。

### Removed

- 移除 `math-commands.tex`。

### Fixed

- 修正附录章节的编号。
- 修正参考文献中期刊的页码前的空格（[#264](https://github.com/ustctug/ustcthesis/issues/264)）。


## [3.2.1] - 2020-04-03

### Added

- 添加对 `chapterbib` 宏包的支持。

### Fixed

- 修正 LaTeX3 的 `\str_if_eq_x` 已过时的报错 - [#241](https://github.com/ustctug/ustcthesis/issues/241)

### Removed

移除 `.dtx` 文件。

## [3.2] - 2020-01-01

### Changed

- 使用 `\ustcsetup` 进行设置。
- 目录开启于奇数页。

### Added

- 导入 goodfeli/dlbook_notation 的 `math-commands.tex`。

## [3.1.06] - 2019-05-01

### Fixed

- 处理 `hyperref` 与 `unicode-math` 的兼容性问题 - [#223](https://github.com/ustctug/ustcthesis/issues/223)。

## [3.1.05] - 2019-04-21

### Changed

- 使用 XITS Math 作为数学字体。

## [3.1.04] - 2019-03-21

### Fixed

- 禁止扩大段间距 - [#209](https://github.com/ustctug/ustcthesis/issues/209)。
- 修正图表标题与正文之间的距离。

## [3.1.03] - 2019-01-01

### Fixed

- 修正英文模式下的 Unicode 引号字体 - [CTeX-org/ctex-kit#309](https://github.com/CTeX-org/ctex-kit/issues/389)。
- 修正算法的格式。
- 修正图表清单的格式。

## [3.1.02] - 2018-10-30

### Changed

- 取消依赖 `hyperref`。

### Added

- 支持 `siunix` 宏包。
- 支持 `nomencl` 宏包。

### Fixed

- 修正 macOS 的伪粗黑体。

## [3.1.01] - 2018-10-06

### Changed

- 调整伪粗体的粗细程度。
- 同步 `xits` 字体文件名的修改。
- 取消依赖 `etoolbox`。

### Fixed

- 修正 Windows 上“找不到 Courier New”。
- 更正章节标题的行距。

## [3.1] - 2018-09-01

### Changed

- 使用 `unicode-math` 处理数学字体。
- 优化了浮动体放置策略的默认参数。

### Fixed

- 更正封面的校名。
- 更正了数学符号以满足国标要求。
- 更正 subsubsection 的前后距离。
- 修复列表中各项之间过大的间距。

## [3.0.b] - 2018-05-18

### Fixed

- 更正符号说明的字号。
- 更正研究生的目录为另面起。
- 更正本科生参考文献的字号。

## [3.0.a] - 2018-05-16

### Fixed

- 更正本科生英文模板的章节格式。
- 更正图表的注释格式。

## [3.0.9] - 2018-05-04

### Changed

- 调整 subsubsection 的缩进。
- 参考文献不再著录“出版地不详”等信息。

## [3.0.8] - 2018-04-21

### Fixed

- 更正 subsection 的格式。

## [3.0.7] - 2018-04-18

### Added

- 参考文献允许著录多个 DOI。

### Fixed

- 更正页眉英文大写的错误。
- 更正本科生 subsection 的缩进。

## [3.0.6] - 2018-04-12

### Changed

- 取消使用微软雅黑。

### Fixed

- 修正文献引用之间的连接号为 hyphen。
- 修正参考文献页码的连接号为 hyphen。

## [3.0.5] - 2018-04-11

### Fixed

- 更正“专业学位类型"的字体。
- 专业学位的封面更正为“专业领域”。

## [3.0.4] - 2018-03-30

### Fixed

- 脚注按页计数。

## [3.0.3] - 2018-03-29

### Fixed

- 顺序编码制连续两个文献引用之间使用连接号。

## [3.0.2] - 2018-03-16

### Changed

- 著者-出版年式文献引用不再排序。

### Fixed

- 更正本科生的页码。
- 更正参考文献姓名的“others”。

## [3.0.1] - 2017-12-12

### Fixed

- 更正范数命令失效的错误。
- 更正 paragraph 的前后距离。


## [3.0] - 2017-07-01

### Added

- 页码居中。
- 脚注线长度为版心宽度四分之一。
- 脚注用带圈序号，缩进两字。
- 符号说明不加页码。
- 章题为两字时中间空两字，三字时空一字，四字时空半字，四字以上不空。
- 空白页不加页眉。
- 正文新的一章另面起。
- 更正了 LaTeX 的大于等于号。
- 新增二级以下节标题的缩进。
- 摘要关键词间隔符号改用分号。
- 摘要不再加入目录。
- 图表的编号、标题加粗。
- 参考文献列表不出现“[S.l.]: [s.n.]”。
- 允许文献序号作为叙述文字的一部分。
- 优化图注、算法的行距。
- 二级以下节标题编号下采用“1.”、“(1)”、“①”。

[Unreleased]: https://github.com/ustctug/ustcthesis/compare/v4.0.0-beta.9...HEAD
[4.0.0-beta.9]: https://github.com/ustctug/ustcthesis/compare/v4.0.0-beta.8...v4.0.0-beta.9
[4.0.0-beta.8]: https://github.com/ustctug/ustcthesis/compare/v4.0.0-beta.7...v4.0.0-beta.8
[4.0.0-beta.7]: https://github.com/ustctug/ustcthesis/compare/v4.0.0-beta.6...v4.0.0-beta.7
[4.0.0-beta.6]: https://github.com/ustctug/ustcthesis/compare/v4.0.0-beta.5...v4.0.0-beta.6
[4.0.0-beta.5]: https://github.com/ustctug/ustcthesis/compare/v4.0.0-beta.4...v4.0.0-beta.5
[4.0.0-beta.4]: https://github.com/ustctug/ustcthesis/compare/v4.0.0-beta.3...v4.0.0-beta.4
[4.0.0-beta.3]: https://github.com/ustctug/ustcthesis/compare/v4.0.0-beta.2...v4.0.0-beta.3
[4.0.0-beta.2]: https://github.com/ustctug/ustcthesis/compare/v4.0.0-beta.1...v4.0.0-beta.2
[4.0.0-beta.1]: https://github.com/ustctug/ustcthesis/compare/v3.3.5...v4.0.0-beta.1
[3.3.5]: https://github.com/ustctug/ustcthesis/compare/v3.3.4...v3.3.5
[3.3.4]: https://github.com/ustctug/ustcthesis/compare/v3.3.3...v3.3.4
[3.3.3]: https://github.com/ustctug/ustcthesis/compare/v3.3.2...v3.3.3
[3.3.2]: https://github.com/ustctug/ustcthesis/compare/v3.3.1...v3.3.2
[3.3.1]: https://github.com/ustctug/ustcthesis/compare/v3.3.0...v3.3.1
[3.3.0]: https://github.com/ustctug/ustcthesis/compare/v3.2.1...v3.3.0
[3.2.1]: https://github.com/ustctug/ustcthesis/compare/v3.2...v3.2.1
[3.2]: https://github.com/ustctug/ustcthesis/compare/v3.2...v3.1.06
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
