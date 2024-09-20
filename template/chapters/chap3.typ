#import "@preview/gentle-clues:1.0.0": *
#import "@preview/lovelace:0.3.0": *
#import "@preview/algo:0.3.3": algo, i, d, comment, code


= 实用组件 <chapter3>

== 高亮块(Admonitions)

#tip(title: `gentle-clues`)[高亮块借助`gentle-clues`库来实现。]

#example(title: "示例")[示例高亮块]

== 算法伪代码

#example(title: `lovelace`)[
   @lovelace_demo 是实用`lovelace`库输出的伪代码示例。

  #figure(
  kind: "algorithm",
  supplement: [Algorithm],

  pseudocode-list(booktabs: true, numbered-title: [My cool algorithm])[
    + do something
    + do something else
    + *while* still something to do
      + do even more
      + *if* not done yet *then*
        + wait a bit
        + resume working
      + *else*
        + go home
      + *end*
    + *end*
  ]
) <lovelace_demo>
]


#example(title: `algo`)[
下面是用`algo`库输出的伪代码示例。

#algo(
  title: [                    // note that title and parameters
    #set text(size: 15pt)     // can be content
    #emph(smallcaps("Fib"))
  ],
  parameters: ([#math.italic("n")],),
  comment-prefix: [#sym.triangle.stroked.r ],
  comment-styles: (fill: rgb(100%, 0%, 0%)),
  indent-size: 15pt,
  indent-guides: 1pt + gray,
  row-gutter: 5pt,
  column-gutter: 5pt,
  inset: 5pt,
  stroke: 2pt + black,
  fill: none,
)[
  if $n < 0$:#i\
    return null#d\
  if $n = 0$ or $n = 1$:#i\
    return $n$#d\
  \
  let $x <- 0$\
  let $y <- 1$\
  for $i <- 2$ to $n-1$:#i #comment[so dynamic!]\
    let $z <- x+y$\
    $x <- y$\
    $y <- z$#d\
    \
  return $x+y$
]

]