i =: 1!:1<'inputs/i4.txt'
m =: >LF cut i

NB. find horizontal and vertical string matches
lr =: +/,('XMAS'&E."1 + 'SAMX'&E."1)m
ud =: +/,('XMAS'&E."1 + 'SAMX'&E."1)|:m

NB. the strategy is to run a filter over the matrix and match characters
NB. if the number of matching characters is 4 we have a complete match
s =:1 1,: 4 4
x =: 4 4 $ 'X....M....A....S'
d1 =: +/,4=+/"1,"2 s x&=;._3 m
x =: 4 4 $ 'S....A....M....X'
d2 =: +/,4=+/"1,"2 s x&=;._3 m
x =: 4 4 $ '...X..M..A..S...'
d3 =: +/,4=+/"1,"2 s x&=;._3 m
x =: 4 4 $ '...S..A..M..X...'
d4 =: +/,4=+/"1,"2 s x&=;._3 m

NB. sum all above matches
res1 =: lr+ud+d1+d2+d3+d4


NB. same filter strategy with possible X formations
s =:1 1,: 3 3
x =: 3 3 $ 'M.S.A.M.S'
c1 =: +/,5=+/"1,"2 s x&=;._3 m
x =: 3 3 $ 'M.M.A.S.S'
c2 =: +/,5=+/"1,"2 s x&=;._3 m
x =: 3 3 $ 'S.S.A.M.M'
c3 =: +/,5=+/"1,"2 s x&=;._3 m
x =: 3 3 $ 'S.M.A.S.M'
c4 =: +/,5=+/"1,"2 s x&=;._3 m

res2 =: c1+c2+c3+c4

echo 'p1';res1
echo 'p2';res2

exit 0
