i =: 1!:1<'inputs/i5.txt'

NB. find location that separates ordering rules and update lists
s =: 0{I.(LF,LF)E.i
o =: i{~i.s
NB. create 2 column matrix of which pages go before and which go after
ba =: "."1>>'|'cut &. >cutLF o
NB. create list of boxes holding update lists
l =: ".&.>cutLF i{~([+i.@((#i)&-))s+2

NB. filter the ordering rules so that it only contains rows of pages in the update list
NB. check if any element in ordering rules is a member of the update list
NB. find indices where both columns are true
NB. select those rows from the full ordering rules
fl =: {&ba@:I.@:(*./"1)@:(ba&e.)&.>l
NB. find which update lists are valid
NB. create box of tables comparing each page in the update list with each element in ordering rules
NB. create box of ranges from 0 to len(list)
NB. multiply each range by the collection of tables to indicate which element index was matched in that table
NB. (e.g. 0th table will be multiplied with 0, 1st table with 1, ...) since the
NB. 0th table corresponds to matches of 0th element
NB. sum the tables so that we now have a single table in each box where each element is the matched index
NB. we can then test that ordering rules hold by using < between the columns, and then applying and reduction: *./
NB. the indices of 1 are the valid update lists
v =: I.>(i.@# &.>l) (*./@:(</"1)@:(+/)@:*)&.> (l=/&.>fl)

NB. find middle number of valid lists and sum
NB. middle number = floor(len(list)/2)
res1 =: +/>((<.@:-:@:#&.>){&.>]) v{l

NB. get the not valid elements
nv =: I.-.v e.~i.#l
fl =: nv { fl

NB. get the first page of the update list
NB. it is the only page that has no other pages before it i.e. it doesn't appear on the right list
NB. get left list and drop duplicates
NB. get right list and drop duplicates
NB. find which element is missing from the right list (get its index and extract from list)
f =: >(I.@:-.@(({."1)(e.&:~.)({:"1)){{."1)&.>fl

NB. get the rest of the pages in the list
NB. the order of the pages depends on how many times it appears on the right list
NB. the fewer times it appears after something the sooner it appears in the update list
NB. self classify and sum rows to find how many times the element appears in the list
NB. grade the list of counts to order by increasing counts
NB. drop duplicate pages from the original list and use the above order to extract the pages sorted by their count
r =: (((/:)@:(+/"1)@:=@:({:"1)){~.@:({:"1))&.>fl

NB. find middle number of valid lists and sum
res2 =: +/>((<.@:-:@:#){])&.>f,&.>r

echo 'p1';res1
echo 'p2';res2

exit 0
