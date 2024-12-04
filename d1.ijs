i =: 1!:1 <'inputs/i1.txt'

NB. extract left and right lists from input
'l r' =: (0&{"1;1&{"1) ".>LF cut i
NB. sort, take absolute difference, and sum
res1 =: +/|l-&:(/:~)r
NB. create table testing equality of all pairs
NB. sum rows, multiply by corresponding number, and sum
res2 =: +/r*+/ l=/r

smoutput 'p1'; res1
smoutput 'p2'; res2

exit 0
