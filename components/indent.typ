//ref: https://github.com/sysu/better-thesis/blob/a9c9b4828a7e7d751fd51a945ffbf35b907c6ee6/utils/indent.typ#L1C1-L6C78

// 中文缩进
#let indent = h(2em)

// 假段落，附着于 heading 之后可以实现首行缩进
#let empty-par = par[#box()]
#let fake-par = context empty-par + v(-measure(empty-par + empty-par).height)