#import "./components/indent.typ": fake-par
#import "./components/font.typ": 字体, 字号

#import "@preview/outrageous:0.1.0"



#let book(title, doc) = {
  set text(lang: "zh")
  
  set page(
    paper: "a4",
    margin: (top: 25mm, bottom: 20mm, x:30mm),
    header: align(
      center + horizon,
      title
    ),
  )

  set par(justify: true)

  // 字体
  // set text(
  //   font: "Linux Libertine",
  //   size: 11pt,
  // )


  // 标题编号
  set heading(numbering: "1.1.1.1")
  // 标题增加垂直间隔
  show heading: it => {
    set align(center)
    strong(it)
    v(2em, weak: true)
  }
  // 目录标题 楷体三号居中
  // 正文各章标题 楷体三号居中
  // 参考文献标题 楷体三号居中
  // 致谢、附录标题	楷体三号居中
  show heading.where(level: 1): set text(font: 字体.楷体, size: 字号.三号)
  show heading.where(level: 1): set align(center)
  // 正文各节一级标题 楷体四号左对齐
  show heading.where(level: 2): set text(font: 字体.楷体, size: 字号.四号)

  // 正文各节二级及以下标题 宋体小四号加粗左对齐空两格
  show heading.where(level: 3): set text(font: 字体.宋体, size: 字号.小四, weight: "bold")
  show heading.where(level: 4): set text(font: 字体.宋体, size: 字号.小四, weight: "bold")
  show heading.where(level: 3): it => pad(left: 2em, it)
  show heading.where(level: 4): it => pad(left: 2em, it)

  // 目录
  show outline.entry: outrageous.show-entry

  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    set text(font: 字体.楷体, 
    weight: "bold",
    )
    it
  }

  show outline.entry.where(
    level: 2
  ): it => {
    set text(font: 字体.楷体, 
    weight: "light",
    )
    it
  }

    show outline.entry.where(
    level: 3
  ): it => {
    set text(font: 字体.楷体, 
    weight: "light",
    )
    it
  }
  outline(title: "目录", depth: 3, indent: auto)
  pagebreak()


  // 页码
  set page(numbering: "1")
  set page(footer: context [
    *行百里者半九十*
    #h(1fr)
    #counter(page).display(
      "1/1",
      both: true,
    )
  ])
  counter(page).update(1)

  // ref: https://github.com/sysu/better-thesis/blob/a9c9b4828a7e7d751fd51a945ffbf35b907c6ee6/specifications/bachelor/lib.typ#L205-L212
  // 正文段落按照中文惯例缩进两格
  set par(first-line-indent: 2em)
  // 通过插入假段落修复[章节第一段不缩进问题](https://github.com/typst/typst/issues/311)
  show heading: it => {
    it
    fake-par
  }


  // 公式编号
  set math.equation(numbering: "(1)")

  // 单栏
  columns(1, doc)

}




#let amazed(term, color: fuchsia) = {
  text(color, box[✨ #term ✨])
}