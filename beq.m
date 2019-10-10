function binary = beq(rt,rs,imm)
%    if rs == rt advance_pc (imm << 2);
%    note when jumping start indexing from -1
%    for instance if i wanted to jump back 4 instructions to the add
%    instruction
%      add(1,2,3)   -4
%      sub(4,5,6)   -3
%      ldr(8,0,56)  -2
%      beq(0,0,-4)  -1 <= start here
%      str(7,0,32)   0
%      sub(1,2,3)    1
    binary = formatcommand([dec2tc(4,6),dec2tc(rs,5),dec2tc(rt,5),dec2tc(imm ,16)]);
end