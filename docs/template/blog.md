# 博客元数据

博客的元数据位于整个博客文件的开头，第1行必为`---`，也以`---`作为最后一行来结束。接下来列出一些我常用的可接受的参数。

`title`: 指定博客的标题。用于导航栏，若不指定将默认为正文的一级标题。

`date`: 指定相关的日期。实例如下，注意日期的格式：

```text
date: 
  created: 2025-04-04
  updated: 2025-04-05
```

`categories`: 指定文章所归入的分类。可以指定多个。mkdocs会在"分类"页面中将具有相同分类的文章归到一起。我启用了校验机制，仅能输入已在`mkdocs.yml`中定义的分类。格式如下：

```text
categories:
  - example1
  - example2
```

`tags`: 指定标签。用法与`categories`类似，不同之处为它可以填入任何内容，没有限制。它会显示在博客标题的上方。

`description`: 在这里填入对博客的描述。

`slug`: 它将会影响到最后构建时每篇博客的文件名。若为同一天的博客，此参数不能重复。

`links`: 给出相关链接。可以指定多个。链接为必须，标题可选。格式如下：

```text
links:
  标题: 链接
```

`readtime`: 指定博客的阅读时间，单位为分钟。若不指定将按照内置的方法计算（每分钟265词），但由于内置的分词方式是用来计算英文的，对于中文的逻辑很奇怪，因此它计算出来的时间往往不可靠。

/// note | 计算阅读时间的方法
在博客中，若阅读时间为手动指定，则按以下方法得出：

将正文内容去除格式标识（包括但不限于markdown格式、元数据等）后将余下内容放入word应用程序进行字数统计。相关数据按照以下方法进行计算：

- 英文部分：按照1分钟265词计算（内置阅读速度就是265）
- 中文部分：按照1分钟600字计算（假设一目十行的读，这个速度也应该是会少算时间了）

两个时间加起来，然后视情况取整。
///

附：若在正文中使用`<!-- more -->`，将会使得它以下的内容在全部博客的页面隐藏，但是仍然可以在单篇博客页面看到全文。
