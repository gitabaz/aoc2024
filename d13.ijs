i =: 1!:1<'inputs/i13.txt'

NB. find location of double line feeds and use that to split each block of inputs
l =: ((1) _1} ((LF,LF) E. i)) <;._2 i

NB. parse the input into a matrix with columns
NB. Ax Ay Bx By Px Py
r =: ,.>".@(2&}.)&.>>',' cut &.>>(_2 _1)&{@cut &.>>cutLF &.> l
A =: 2 1 |: 2 2 $"1 r
b =: _2 _1 {"1 r

NB. solve linear equation
s =: b %."1 2 A

NB. find whole number solutions and multiply by token cost
v =: (I.*./"1 s = <. s) { s
res1 =: +/(3 1) * +/ v

echo 'p1';res1

exit 0
