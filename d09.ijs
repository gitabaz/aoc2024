i =: 1!:1<'inputs/i9.txt'

NB. remove trailing LF and read input as integers
m =: >".&.>}:i
NB. location of spaces and files
s =: |~&2 i. #m
f =: -.s

NB. replace files with ID and spaces with _1 and expand the blocks
b =: m # (i.#I.f) (I.f) } _1(I.s)}m
NB. number of spaces (negated for later convenience)
ns =: -+/_1=b
NB. take last items and reverse
li =: |.ns{. |:(I.-._1=b){b
NB. update block by replacing _1 with items from li
NB. and drop the last ns items which would have been _1
b =: ns}.li(I._1=b)}b
NB. compute checksum: block position * id
res1 =: +/b*(i.#b)

echo 'p1';res1

exit 0
