# 警告框

英文名"Admonitions"，中文可叫做"警告框"、"高亮块"等。现将所有支持的类型及其参数罗列如下，以备不时之需。

支持直接使用的参数：`note`, `tip` / `hint`, `warning` / `attention` / `caution`, `danger` / `error`

语法如下：

```text
/// note | Some title
Some content
///
```

其余参数需要使用完整语法，以上参数亦可。

```text
/// admonition | Some title
    type: warning

Some content
///
```

/// note
***`note`***, `seealso`
///

/// admonition
    type: abstract

`abstract`, `summary`, `tldr`
///

/// admonition
    type: info

`info`, `todo`
///

/// tip
***`tip`***, ***`hint`***, `important`
///

/// admonition
    type: success

`success`, `check`, `done`
///

/// admonition
    type: question

`question`, `help`, `faq`
///

/// warning
***`warning`***, ***`caution`***, ***`attention`***
///

/// admonition
    type: failure

`failure`, `fail`, `missing`
///

/// danger
***`danger`***, ***`error`***
///

/// admonition
    type: bug

`bug`
///

/// admonition
    type: example

`example`
///

/// admonition
    type: quote

`quote`, `cite`
///
