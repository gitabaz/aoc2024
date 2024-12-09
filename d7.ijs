i =: 1!:1<'inputs/i7.txt'

t =:".>0{"1 >':' cut &.> cutLF i
l =:".&.>1{"1 >':' cut &.> cutLF i

NB. keep running list of possible combinations of + and * at each step
r =: [ F.. {{(x+y),(x*y)}} &.>l
NB. check if any of the elements of list = target and find indices
NB. extract targets and sum
res1 =: +/;t{~I.0<+/|:>,.t=&.>r


NB. keep running list of possible combinations of + and * and || (concat) at each step
r =: [ F.. {{(x+y),(x*y),".>(<":x),~&.>(cut ":y)}} &.>l
res2 =: +/;t{~I.0<+/|:>,.t=&.>r

echo 'p1';res1
echo 'p2';res2

exit 0
