i =: 1!:1<'inputs/i22.txt'

in =: ;".&.>cutLF i

s =: {{
r =: 16777216 | ((22 b.) 64&*) y
r =: 16777216 | ((22 b.) <.@%&32) r
r =: 16777216 | ((22 b.) 2048&*) r
}}



res1 =: +/s^:2000 in

echo 'p1';res1

exit 0