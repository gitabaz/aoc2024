i =: 1!:1<'inputs/i25.txt'

((LF,LF)&E. <;._2 [) i,LF

r =: (>@cutLF)&.>((LF,LF)&E. <;._2 [) i,LF

ll =: >('#####'&-:@(0&{))&.>r
l =: '#'&=&.> r {~ I. ll
k =: '#'&=&.> r {~ I. -.ll
m =: (>l) (+/@,@:*.)"2/ (>k)
res1 =: +/0=,m

echo 'p1';res1

exit 0
