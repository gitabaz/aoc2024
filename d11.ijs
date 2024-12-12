i =: 1!:1<'inputs/i11.txt'
s =: ".}:i

f =: {{
s =. y

NB. keep track of unique values and their counts
NB. this way we don't have to recalculate the same update rules multiple times
u1 =. +/"1(=s)
s =. ~.s

NB. find indices of elements that satisfy the each rule
NB. r1: number is 0
r1 =. I.0=s
NB. r2: even number of digits
r2 =. I.0=2|>+/@#@":&.>s
NB. filter r1s in r2
r2 =. r2{~I.-.r2 e. r1
NB. remaining indices go to r3
r3 =. I.-.(i.#s)e. r1,r2

NB. apply rules
s =. 1 r1 } s
s =. (2024*r3{s) r3}s
s =. (sd@(10&#.inv)&.>r2{s) r2 } [&.>s
NB. after applying all the rules duplicate each result based on the counts
s =. ;;&.>u1 # s
}}

NB. apply function 25 times
res1 =: #f^:25 s

echo 'p1';res1

exit 0
