i =: 1!:1 <'inputs/i3.txt'

NB. map
NB. m: 7
NB. u: 6
NB. l: 5
NB. (: 4
NB. ): 3
NB. ,: 2
NB. digit: 1
NB. other: 0

NB. set all valid characters to 1
m =: a. e. 'mul(),1234567890'
NB. in each step increment values of all characters in next level by 1
m =: m + a. e. 'mul(),'
m =: m + a. e. 'mul()'
m =: m + a. e. 'mul('
m =: m + a. e. 'mul'
m =: m + a. e. 'mu'
m =: m + a. e. 'm'

NB. state table
NB.     0    1    2    3    4    5    6    7  
NB.    oth digit  ,    )    (    l    u    m
NB. 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  1 0  wait   m
NB. 1  0 0  0 0  0 0  0 0  0 0  0 0  2 0  0 0  expect u
NB. 2  0 0  0 0  0 0  0 0  0 0  3 0  0 0  0 0  expect l
NB. 3  0 0  0 0  0 0  0 0  4 0  0 0  0 0  0 0  expect (
NB. 4  0 0  5 1  0 0  0 0  0 0  0 0  0 0  0 0  expect digit and start word
NB. 5  0 0  5 0  6 0  0 0  0 0  0 0  0 0  0 0  expect digit or ,
NB. 6  0 0  6 0  0 0  0 0  0 0  0 0  0 0  0 0  expect digit
NB. 7  0 0  7 0  0 0  0 3  0 0  0 0  0 0  0 0  expect digit or ) and end word

s =:  1 8 2 $ 0 0  0 0  0 0  0 0  0 0  0 0  0 0  1 0
s =: s, 8 2 $ 0 0  0 0  0 0  0 0  0 0  0 0  2 0  0 0
s =: s, 8 2 $ 0 0  0 0  0 0  0 0  0 0  3 0  0 0  0 0
s =: s, 8 2 $ 0 0  0 0  0 0  0 0  4 0  0 0  0 0  0 0
s =: s, 8 2 $ 0 0  5 1  0 0  0 0  0 0  0 0  0 0  0 0
s =: s, 8 2 $ 0 0  5 0  6 0  0 0  0 0  0 0  0 0  0 0
s =: s, 8 2 $ 0 0  7 0  0 0  0 0  0 0  0 0  0 0  0 0
s =: s, 8 2 $ 0 0  7 0  0 0  0 3  0 0  0 0  0 0  0 0

NB. execute state machine
r =: (0;s;m;0 _1 0 0) ;: i

NB. turn box of strings to matrix of numbers, multiply, columns, and sum
res1 =: +/*/"1".>r

NB. same process as before but now we account for the characters: don't
m =: a. e. 'don''tmul(),1234567890'
m =: m + a. e. 'don''tmul(),'
m =: m + a. e. 'don''tmul()'
m =: m + a. e. 'don''tmul('
m =: m + a. e. 'don''tmul'
m =: m + a. e. 'don''tmu'
m =: m + a. e. 'don''tm'
m =: m + a. e. 'don''t'
m =: m + a. e. 'don'''
m =: m + a. e. 'don'
m =: m + a. e. 'do'
m =: m + a. e. 'd'

NB. similar state table but handle: do(), don't()
NB.      0     1     2    3     4    5    6    7    8    9   10   11   12
NB.     oth  digit   ,    )     (    l    u    m    t    '    n    o    d
NB. 0   0 0   0 0   0 0  0 0   0 0  0 0  0 0  7 0  0 0  0 0  0 0  0 0  1 1
NB. 1   0 0   0 0   0 0  0 0   0 0  0 0  0 0  0 0  0 0  0 0  0 0  2 0  0 0
NB. 2   0 0   0 0   0 0  0 0   3 0  0 0  0 0  0 0  0 0  0 0  4 0  0 0  0 0
NB. 3   0 0   0 0   0 0  0 3   0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
NB. 4   0 0   0 0   0 0  0 0   0 0  0 0  0 0  0 0  0 0  5 0  0 0  0 0  0 0
NB. 5   0 0   0 0   0 0  0 0   0 0  0 0  0 0  0 0  6 0  0 0  0 0  0 0  0 0
NB. 6   0 0   0 0   0 0  0 0   3 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
NB. 7   0 0   0 0   0 0  0 0   0 0  0 0  8 0  0 0  0 0  0 0  0 0  0 0  0 0
NB. 8   0 0   0 0   0 0  0 0   0 0  9 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
NB. 9   0 0   0 0   0 0  0 0  10 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
NB. 10  0 0  11 1   0 0  0 0   0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
NB. 11  0 0  11 0  12 0  0 0   0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
NB. 12  0 0  13 0   0 0  0 0   0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
NB. 13  0 0  13 0   0 0  0 3   0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0

s =:  1 13 2 $ 0 0   0 0   0 0  0 0   0 0  0 0  0 0  7 0  0 0  0 0  0 0  0 0  1 1
s =: s, 13 2 $ 0 0   0 0   0 0  0 0   0 0  0 0  0 0  0 0  0 0  0 0  0 0  2 0  0 0
s =: s, 13 2 $ 0 0   0 0   0 0  0 0   3 0  0 0  0 0  0 0  0 0  0 0  4 0  0 0  0 0
s =: s, 13 2 $ 0 0   0 0   0 0  0 3   0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
s =: s, 13 2 $ 0 0   0 0   0 0  0 0   0 0  0 0  0 0  0 0  0 0  5 0  0 0  0 0  0 0
s =: s, 13 2 $ 0 0   0 0   0 0  0 0   0 0  0 0  0 0  0 0  6 0  0 0  0 0  0 0  0 0
s =: s, 13 2 $ 0 0   0 0   0 0  0 0   3 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
s =: s, 13 2 $ 0 0   0 0   0 0  0 0   0 0  0 0  8 0  0 0  0 0  0 0  0 0  0 0  0 0
s =: s, 13 2 $ 0 0   0 0   0 0  0 0   0 0  9 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
s =: s, 13 2 $ 0 0   0 0   0 0  0 0  10 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
s =: s, 13 2 $ 0 0  11 1   0 0  0 0   0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
s =: s, 13 2 $ 0 0  11 0  12 0  0 0   0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
s =: s, 13 2 $ 0 0  13 0   0 0  0 0   0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0
s =: s, 13 2 $ 0 0  13 0   0 0  0 3   0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0  0 0

r =: (0;s;m;0 _1 0 0) ;: i

NB. find locations of do and don't in the output
d =: (<'do(') E. r
dn =: (<'don''t(') E. r

NB. find boxes that should be summed
NB. combine d and dn into single list with dn set to _1
NB. use fold to keep track of previous value and current value indicating whether the box should be kept
NB. cur old = keep
NB.  1  _1  =  1
NB.  1   1  =  1
NB.  1   0  =  1
NB. _1   1  = _1
NB. _1  _1  = _1
NB. _1   0  = _1
NB. simple formula is: sgn(cur + old/2)
NB. turn the list into binary, remove the do() boxes, and find the indices of valid boxes to extract from result
v =: (I.d-~0<(1*F:.(+-:)d-dn)){r

NB. turn box of strings to matrix of numbers, multiply, columns, and sum
res2 =: +/*/"1".>v

smoutput 'p1';res1
smoutput 'p2';res2
