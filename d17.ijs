i =: 1!:1<'inputs/i17.txt'

'a b c p' =: ".&.>({~I.@(2&|)@i.@#);':'&cut &.>cutLF i
o =: i.0
ip =: 0

NB. The adv instruction (opcode 0) performs division. The numerator is the
NB. value in the A register. The denominator is found by raising 2 to the power
NB. of the instruction's combo operand. (So, an operand of 2 would divide A by
NB. 4 (2^2); an operand of 5 would divide A by 2^B.) The result of the division
NB. operation is truncated to an integer and then written to the A register.
adv =: {{
a =: <. a % 2 ^ y { 0, 1, 2, 3, a, b, c
ip =: ip+2
}}

NB. The bxl instruction (opcode 1) calculates the bitwise XOR of register B and
NB. the instruction's literal operand, then stores the result in register B.
bxl =: {{
b =: b (22 b.) y
ip =: ip+2
}}

NB. The bst instruction (opcode 2) calculates the value of its combo operand
NB. modulo 8 (thereby keeping only its lowest 3 bits), then writes that value
NB. to the B register.
bst =: {{
b =: 8 | y { 0, 1, 2, 3, a, b, c
ip =: ip+2
}}

NB. The jnz instruction (opcode 3) does nothing if the A register is 0.
NB. However, if the A register is not zero, it jumps by setting the instruction
NB. pointer to the value of its literal operand; if this instruction jumps, the
NB. instruction pointer is not increased by 2 after this instruction.
jnz =: {{
ip =: (y*(1-a=0)) + (a=0) * ip + 2
}}

NB. The bxc instruction (opcode 4) calculates the bitwise XOR of register B and
NB. register C, then stores the result in register B. (For legacy reasons, this
NB. instruction reads an operand but ignores it.)
bxc =: {{
b =: b (22 b.) c
ip =: ip+2
}}

NB. The out instruction (opcode 5) calculates the value of its combo operand
NB. modulo 8, then outputs that value. (If a program outputs multiple values,
NB. they are separated by commas.)
out =: {{
o =: o, 8 | y { 0, 1, 2, 3, a, b, c
ip =: ip+2
}}

NB. The bdv instruction (opcode 6) works exactly like the adv instruction
NB. except that the result is stored in the B register. (The numerator is still
NB. read from the A register.)
bdv =: {{
b =: <. a % 2 ^ y { 0, 1, 2, 3, a, b, c
ip =: ip+2
}}

NB. The cdv instruction (opcode 7) works exactly like the adv instruction
NB. except that the result is stored in the C register. (The numerator is still
NB. read from the A register.)
cdv =: {{
c =: <. a % 2 ^ y { 0, 1, 2, 3, a, b, c
ip =: ip+2
}}

opc =: adv`bxl`bst`jnz`bxc`out`bdv`cdv

run =: {{
opc@.(ip{y)y{~ip+1
_2 Z: ip (>:#) p
p
}}

] F. run p

res1 =: ',' (I.(2&|)i.#":o) } ":o

echo 'p1';res1

exit 0
