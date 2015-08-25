# USTC Thesis

这是 ustcthesis v2.0 的开发项目。

原项目 [ywgATustcbbs/ustcthesis](https://github.com/ywgATustcbbs/ustcthesis) 存在一些细节与学校要求不符，并且有一些历史遗留问题，所以进行重写。



## 如何构建

ustcthesis v2.0 要求使用 TeX Live 2015 发行版，并且尽可能升级到最新；尤其依赖于 ctex 2.0 以及更高版本。

最简单的方法是使用 GNU Make：

生成论文 `main.pdf` 使用命令
```
make thesis
```
生成说明文档 `ustcthesis.pdf` 使用命令
```
make doc
```

如果手工编译，请参考 Makefile 内容。



## 已知问题

- [ ] 单倍行距设置
- [ ] 本科目录空行过多
- [ ] 暂不支持英文标题名
- [ ] 参考文献格式不支持 author-year 式
- [ ] 本科参考文献格的英文文献名需要斜体
- [ ] 不支持制作带书脊的封面页（待确认）
