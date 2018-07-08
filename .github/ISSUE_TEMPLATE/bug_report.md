---
name: Bug report
about: Create a report to help us improve

---

## 描述问题
《撰写手册》要求……而模板编译的结果是……

## 检查
- [ ] 已经将模板升级到了最新版
- [ ] 已经阅读《撰写手册》
- [ ] 已经阅读使用说明文档 `ustcthesis.pdf`
- [ ] 已经阅读 [常见问题](https://github.com/ustctug/ustcthesis/wiki/常见问题)

## 复现问题
编译的系统：macOS 10.13 / Windows 10 / Ubuntu 18.04
TeX 发行版：MacTeX 2018 / TeX Live 2018 / MikTeX 2.9.6753
模板类型： doctor / master / bachelor
（可选）`ctex` 宏包版本：v2.4.14
（可选）`unicode-math` 宏包版本：v0.8l

示例代码：
```LaTeX
\documentclass[doctor]{ustcthesis}
\begin{document}
abc
\end{document}
```

## 截图



说明：图中 A 处是 B 效果，应该是 C 效果。
