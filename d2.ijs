i =: 1!:1 < 'inputs/i2.txt'
r =: LF cut i

NB. compute difference between adjacent elements
NB. by shifting array, subtracting, and dropping last element
d =: }:@([-1&|.)@ ". &.> r
NB. check all entries 0 < x <= 3
c1 =: (>&0*.<&4)@:|&.>d
NB. check all entries increasing/decreasing
c2 =: *&.>d
NB. combine both conditions
c =: c1 *&.> c2
NB. rows that satisfy both conditions have abs(sum) = len
res1 =: +/;(#=([:|+/))&.>c
NB. rows with a single bad level have abs(sum) differing from len by at most 2
NB. but this doesn't recalculate the differences between the new adjacent elements
NB. res2 =: +/;(#-([:|+/))&.>c

smoutput 'p1';res1
NB. smoutput 'p2';res2

exit 0
