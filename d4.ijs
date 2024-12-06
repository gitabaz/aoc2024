i =: 1!:1<'inputs/i4.txt'
m =: >LF cut i

NB. find horizontal and vertical string matches
w =: 'XMAS'
lr =: +/,m(E."1~+(E."1~|.))w
ud =: +/,(|:m)(E."1~+(E."1~|.))w

NB. the strategy is to run a filter over the matrix and match characters
NB. if the number of matching characters is 4 we have a complete match
s =:1 1,: 4 4
w =: 'X....M....A....S'
d1 =: +/,4=+/"1,"2 s (4 4 $ w)&=;._3 m
d2 =: +/,4=+/"1,"2 s (4 4 $ |.w)&=;._3 m
w =: '...X..M..A..S...'
d3 =: +/,4=+/"1,"2 s (4 4 $ w)&=;._3 m
d4 =: +/,4=+/"1,"2 s (4 4 $ |.w)&=;._3 m

NB. sum all above matches
res1 =: lr+ud+d1+d2+d3+d4


NB. same filter strategy with possible X formations
s =:1 1,: 3 3
w =: 'M.S.A.M.S'
c1 =: +/,5=+/"1,"2 s (3 3 $ w)&=;._3 m
c2 =: +/,5=+/"1,"2 s (3 3 $ |.w)&=;._3 m
w =: 'M.M.A.S.S'
c3 =: +/,5=+/"1,"2 s (3 3 $ w)&=;._3 m
c4 =: +/,5=+/"1,"2 s (3 3 $ |.w)&=;._3 m

res2 =: c1+c2+c3+c4

echo 'p1';res1
echo 'p2';res2

exit 0
