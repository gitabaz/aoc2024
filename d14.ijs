i =: 1!:1<'inputs/i14.txt'
'w h' =: 101 103

NB. extract position and velocity coordinates from input
pv =: ".&.>&.>','&cut &.>1{"1>>'='&cut &.>@cut &.> cutLF i
p =: >>0{"1 pv
v =: >>1{"1 pv

NB. update the position
np =: (w&|@(0&{"1),.h&|@(1&{"1)) p + 100*v

NB. build matrix with count of robots at each coordinate
NB. count the number of duplicated coordinates
NB. update each coordinate of the 0 matrix with its count
m =: (+/"1=np) (<"1 ~.|."1 np) } (h,w) $ 0

NB. run a w/2 by h/2 square across the map to get the sum of robots in each quadrant
q =: ((1 0)+,:~<.%&2 h,w) +/@,;._3 m

NB. compute the product of all quadrants
res1 =: */,q

echo 'p1';res1
